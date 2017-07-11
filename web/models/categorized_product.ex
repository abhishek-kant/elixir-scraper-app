defmodule ScraperStore.CategorizedProduct do
  use ScraperStore.Web, :model

  schema "categorized_products" do
    belongs_to :category, ScraperStore.Category
    belongs_to :product, ScraperStore.Product
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([:product, :category])
  end
end
