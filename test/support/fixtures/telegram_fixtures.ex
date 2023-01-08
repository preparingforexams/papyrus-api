defmodule PapyrusApi.TelegramFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PapyrusApi.Telegram` context.
  """

  @doc """
  Generate a chat.
  """
  def chat_fixture(attrs \\ %{}) do
    {:ok, chat} =
      attrs
      |> Enum.into(%{
        id: 42,
        name: "some name"
      })
      |> PapyrusApi.Telegram.create_chat()

    chat
  end

  @doc """
  Generate a chat.
  """
  def chat_fixture(attrs \\ %{}) do
    {:ok, chat} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PapyrusApi.Telegram.create_chat()

    chat
  end
end
