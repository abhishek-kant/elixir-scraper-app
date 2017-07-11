defmodule ScraperStore.Repo.Migrations.CreateScrapeCategory do
  use Ecto.Migration

  def change do
    create table(:scrape_category) do
      add :scrape_url, :string
      add :category_id, references(:categories)
      add :scrape_source_id, references(:scrape_sources)
      add :keep_going, :boolean, default: false
      timestamps()
    end

  end
end
