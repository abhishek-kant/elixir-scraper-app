defmodule ScraperStore.TaxonomyTest do
  use ScraperStore.ModelCase

  alias ScraperStore.Taxonomy

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Taxonomy.changeset(%Taxonomy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Taxonomy.changeset(%Taxonomy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
