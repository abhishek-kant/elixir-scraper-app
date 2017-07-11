defmodule ScraperStore.Product do
  use ScraperStore.Web, :model

  schema "products" do
    belongs_to :brand, ScraperStore.Brand
    has_many :categorized_products, ScraperStore.CategorizedProduct, on_delete: :delete_all, on_replace: :delete
    has_many :categories, through: [:categorized_products, :category]
    has_many :image_sources, ScraperStore.ImageSource
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :discounted_price, :decimal
    field :discount, :string
    field :summary, :string
    field :link, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price, :discounted_price, :discount, :link, :summary])
    |> validate_required([:name, :price, :link, :brand])
  end
end
