defmodule Tumblr.PageController do
  use Tumblr.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
