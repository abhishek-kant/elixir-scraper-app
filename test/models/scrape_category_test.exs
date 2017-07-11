defmodule ScraperStore.ScrapeCategoryTest do
  use ScraperStore.ModelCase

  alias ScraperStore.ScrapeCategory

  @valid_attrs %{scrape_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ScrapeCategory.changeset(%ScrapeCategory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ScrapeCategory.changeset(%ScrapeCategory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
