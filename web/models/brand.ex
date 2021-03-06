defmodule ScraperStore.Brand do
  use ScraperStore.Web, :model

  schema "brands" do
    has_many :products, ScraperStore.Product
    field :name, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
