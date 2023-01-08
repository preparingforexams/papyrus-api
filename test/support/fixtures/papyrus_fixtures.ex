defmodule PapyrusApi.PapyrusFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PapyrusApi.Papyrus` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: 42,
        name: "some name"
      })
      |> PapyrusApi.Papyrus.create_item()

    item
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> PapyrusApi.Papyrus.create_item()

    item
  end
end
