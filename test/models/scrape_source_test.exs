defmodule ScraperStore.ScrapeSourceTest do
  use ScraperStore.ModelCase

  alias ScraperStore.ScrapeSource

  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ScrapeSource.changeset(%ScrapeSource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ScrapeSource.changeset(%ScrapeSource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
