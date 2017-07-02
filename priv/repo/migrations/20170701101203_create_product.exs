defmodule ScraperStore.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false, default: ""
      add :description, :text
      add :price, :decimal, precision: 10, scale: 2, null: false, deafault: 0
      add :discounted_price, :decimal, precision: 10, scale: 2
      add :discount, :string
      add :summary, :string
      add :link, :string, null: false, default: ""
      add :brand_id, references(:brands)
      timestamps()
    end

  end
end
