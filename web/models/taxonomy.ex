defmodule ScraperStore.Taxonomy do
  use ScraperStore.Web, :model

  schema "taxonomies" do
    field :name, :string
    has_many :categories, ScraperStore.Category
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
