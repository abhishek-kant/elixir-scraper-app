require IEx;
defmodule FlipkartIndexScraper do

  import Ecto.Query
  alias ScraperStore.Brand
  alias ScraperStore.Product
  alias ScraperStore.Category
  alias ScraperStore.ScrapeCategory
  alias ScraperStore.CategorizedProduct
  alias ScraperStore.Repo
  use Hound.Helpers

   def perform(scrape_category_id, page) do

    scrape_category = Repo.get(ScrapeCategory, scrape_category_id) |> Repo.preload(:category)
    category = scrape_category.category
    url = scrape_category.scrape_url

    if scrape_category.keep_going do
      {:ok, ack} = Exq.enqueue(Exq, "default", ScraperWorker, [scrape_category_id, page + 1])
    end

    products_xml = get_response(url)
      |> get_products

    if length(products_xml) > 0 do
      ScrapeCategory.changeset(scrape_category, %{keep_going: false})
        |> Repo.update
    end


    for product_xml <- products_xml do
      product_params = %{
        name: get_product_name(product_xml),
        link: get_product_link(product_xml),
        price: get_price(product_xml),
        discounted_price: get_discounted_price(product_xml),
        discount: get_discount(product_xml)
      }
      product = Product.changeset(%Product{brand: get_brand(product_xml)}, product_params)
        |> Repo.insert

      CategorizedProduct.changeset(%CategorizedProduct{product: product, category: category},%{})
       |> Repo.insert
    end

   end


  def get_response(url, page \\ 1) do
    url="https://www.flipkart.com/mens-clothing/tshirts/pr?otracker=nmenu_sub_Men_0_T-Shirts&sid=2oq%2Cs9b%2Cj9y&viewType=grid"
    page = 1
    try do
      Hound.start_session
      navigate_to("#{url}/page=#{page}")
      floki_page_source = Floki.parse(page_source())
    after
      Hound.end_session
    end
    floki_page_source
  end

  def get_products floki_response do
    Floki.find(floki_response, ".MP_3W3")
  end

  def get_brand product_xml do
    brand_name = Floki.attribute(product_xml, "data-brand")
     |> Enum.at(0)
    if brand_name do
      find_or_create_brand brand_name
    else
      %Brand{}
    end
  end

  def get_image_source product_xml do
    image_config =  Floki.find(product_xml, ".catalog-img .primary-image")
      |> Floki.attribute("data-img-config")
      |> Poison.decode
    "#{image_config["base_path"]}#{image_config["1600"]}"
  end

  def get_product_link product_xml do
    "http://www.jabong.com/#{Floki.find(product_xml, "a") |> Floki.attribute("href")}"
  end

  def get_product_name product_xml do
    Floki.find(product_xml,".product-info .h4") |> Floki.text
  end

  def get_price product_xml do
    Floki.find(product_xml, ".price > .prev-price > .standard-price") |> Floki.text()
  end

  def get_discounted_price product_xml do
    Floki.find(product_xml, ".price > .standard-price") |> Floki.text()
  end

  def get_discount product_xml do
    Floki.find(product_xml, ".discount")
    |> Floki.text()|> String.replace("(", "")
    |> String.replace(")", "")
    |> String.replace("%","")
  end

  def find_or_create_brand brand_name do
    brand_changeset = Brand.changeset(%Brand{}, %{name: brand_name})
    query = from b in Brand, where: b.name == ^brand_name, limit: 1
    ScraperStore.Repo.one(query) || ScraperStore.Repo.insert!(brand_changeset)
  end

end