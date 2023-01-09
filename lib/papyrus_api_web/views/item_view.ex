defmodule PapyrusApiWeb.ItemView do
  use PapyrusApiWeb, :view
  alias PapyrusApiWeb.ItemView

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{
      id: item.id,
      name: item.name,
      description: item.description,
      done: item.done,
    }
  end
end
