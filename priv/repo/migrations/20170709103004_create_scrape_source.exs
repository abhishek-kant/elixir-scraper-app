defmodule ScraperStore.Repo.Migrations.CreateScrapeSource do
  use Ecto.Migration

  def change do
    create table(:scrape_sources) do
      add :name, :string
      add :url, :string

      timestamps()
    end

  end
end
