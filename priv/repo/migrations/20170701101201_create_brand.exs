defmodule ScraperStore.Repo.Migrations.CreateBrand do
  use Ecto.Migration

  def change do
    create table(:brands) do
      add :name, :string, null: false, default: ""
      timestamps()
    end

  end
end
