defmodule ScraperStore.Category do
  use ScraperStore.Web, :model

  schema "categories" do
    belongs_to :taxonomy, ScraperStore.Taxonomy
    has_many :scrape_categories, ScraperStore.ScrapeCategory, on_delete: :delete_all, on_replace: :delete
    has_many :categorised_products, ScraperStore.CategorizedProduct, on_delete: :delete_all, on_replace: :delete
    has_many :products, through: [:categorised_products, :product]
    field :name, :string
    field :parent_id, :integer
    field :position, :integer
    field :lft, :integer
    field :rgt, :integer
    field :meta_description, :string
    field :meta_keywords, :string
    field :depth, :integer
    field :show_as_filter, :boolean, default: false
    field :show_as_menu_label, :boolean, default: false
    field :show_in_menu, :boolean, default: false
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :parent_id, :position, :lft, :rgt, :meta_description, :meta_keywords, :depth, :show_as_filter, :show_as_menu_label, :show_in_menu, :taxonomy_id])
    |> validate_required([:name])
  end
end
