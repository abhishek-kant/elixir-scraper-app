defmodule ScraperStore.Repo.Migrations.CreateCategorizedProduct do
  use Ecto.Migration

  def change do
    create table(:categorized_products) do
      add :product_id, references(:products)
      add :category_id, references(:categories)
      timestamps()
    end
  end
end
