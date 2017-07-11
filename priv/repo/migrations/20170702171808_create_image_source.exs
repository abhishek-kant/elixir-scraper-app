defmodule ScraperStore.Repo.Migrations.CreateImageSource do
  use Ecto.Migration

  def change do
    create table(:image_sources) do
      add :url, :string
      add :product_id, references(:products)
      timestamps()
    end

  end
end
