defmodule ScraperStore.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :parent_id, references(:categories)
      add :position, :integer
      add :lft, :integer
      add :rgt, :integer
      add :meta_description, :string
      add :meta_keywords, :string
      add :depth, :integer
      add :show_as_filter, :boolean, default: false, null: false
      add :show_as_menu_label, :boolean, default: false, null: false
      add :show_in_menu, :boolean, default: false, null: false
      add :taxonomy_id, references(:taxonomies)

      timestamps()
    end

  end
end
