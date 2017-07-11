defmodule ScraperStore.Repo.Migrations.CreateTaxonomy do
  use Ecto.Migration

  def change do
    create table(:taxonomies) do
      add :name, :string

      timestamps()
    end

  end
end
