defmodule ScraperStore.PageController do
  use ScraperStore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
