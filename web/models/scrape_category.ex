defmodule ScraperStore.ScrapeCategory do
  use ScraperStore.Web, :model

  schema "scrape_category" do
    field :scrape_url, :string
    belongs_to :scrape_source, ScraperStore.ScrapeSource
    belongs_to :category, ScraperStore.Category
    field :keep_going, :boolean
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:scrape_url])
    |> validate_required([:scrape_url])
  end
end
