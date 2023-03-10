defmodule PapyrusApiWeb.ItemController do
  use PapyrusApiWeb, :controller

  alias PapyrusApi.Papyrus
  alias PapyrusApi.Papyrus.Item

  action_fallback PapyrusApiWeb.FallbackController

  def index(conn, _params) do
    items = Papyrus.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Papyrus.create_item(item_params) do
      conn
      |> put_status(:created)
#      |> put_resp_header("location", Routes.item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Papyrus.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Papyrus.get_item!(id)

    with {:ok, %Item{} = item} <- Papyrus.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Papyrus.get_item!(id)

    with {:ok, %Item{}} <- Papyrus.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
