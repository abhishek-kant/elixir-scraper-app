defmodule ScraperStore.Product do
  use ScraperStore.Web, :model

  schema "products" do
    belongs_to :brand, ScraperStore.Brand
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price, :discointed_price, :discount, :link, :brand, :summary])
    |> validate_required([:name, :price, :link, :brand])
  end
end
