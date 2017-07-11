defmodule ScraperStore.ScrapeSource do
  use ScraperStore.Web, :model

  schema "scrape_sources" do
    field :name, :string
    field :url, :string
    has_many :scrape_categories, ScraperStore.Category
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url])
    |> validate_required([:name, :url])
  end
end
