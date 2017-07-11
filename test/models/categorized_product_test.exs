defmodule ScraperStore.CategorizedProductTest do
  use ScraperStore.ModelCase

  alias ScraperStore.CategorizedProduct

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CategorizedProduct.changeset(%CategorizedProduct{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CategorizedProduct.changeset(%CategorizedProduct{}, @invalid_attrs)
    refute changeset.valid?
  end
end
