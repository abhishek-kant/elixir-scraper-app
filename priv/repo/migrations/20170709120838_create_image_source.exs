defmodule ScraperStore.Repo.Migrations.CreateImageSource do
  use Ecto.Migration

  def change do
    create table(:image_sources) do
      add :url, :string, default: "", index: true
      add :product_id, references(:products)
      add :saved, :boolean, default: false
      timestamps()
    end

  end
end
