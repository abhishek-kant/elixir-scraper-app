defmodule ScraperStore.CategoryTest do
  use ScraperStore.ModelCase

  alias ScraperStore.Category

  @valid_attrs %{depth: 42, lft: 42, meta_description: "some content", meta_keywords: "some content", name: "some content", parent_id: 42, position: 42, rgt: 42, show_as_filter: true, show_as_menu_label: true, show_in_menu: true, taxonomy_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    refute changeset.valid?
  end
end
