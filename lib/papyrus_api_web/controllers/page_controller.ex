defmodule PapyrusApiWeb.PageController do
  use PapyrusApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
