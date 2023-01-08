defmodule PapyrusApiWeb.ChatController do
  use PapyrusApiWeb, :controller

  alias PapyrusApi.Telegram
  alias PapyrusApi.Telegram.Chat

  action_fallback PapyrusApiWeb.FallbackController

  def index(conn, _params) do
    chats = Telegram.list_chats()
    render(conn, "index.json", chats: chats)
  end

  def create(conn, %{"chat" => chat_params}) do
    IO.inspect chat_params

    with {:ok, %Chat{} = chat} <- Telegram.create_chat(chat_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.chat_path(conn, :show, chat))
      |> render("show.json", chat: chat)
    end
  end

  def show(conn, %{"id" => id}) do
    chat = Telegram.get_chat!(id)
    render(conn, "show.json", chat: chat)
  end

  def update(conn, %{"id" => id, "chat" => chat_params}) do
    chat = Telegram.get_chat!(id)

    with {:ok, %Chat{} = chat} <- Telegram.update_chat(chat, chat_params) do
      render(conn, "show.json", chat: chat)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat = Telegram.get_chat!(id)

    with {:ok, %Chat{}} <- Telegram.delete_chat(chat) do
      send_resp(conn, :no_content, "")
    end
  end
end
