defmodule ScraperStore.ImageSourceTest do
  use ScraperStore.ModelCase

  alias ScraperStore.ImageSource

  @valid_attrs %{url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ImageSource.changeset(%ImageSource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ImageSource.changeset(%ImageSource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
