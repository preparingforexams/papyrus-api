defmodule PapyrusApi.TelegramTest do
  use PapyrusApi.DataCase

  alias PapyrusApi.Telegram

  describe "chats" do
    alias PapyrusApi.Telegram.Chat

    import PapyrusApi.TelegramFixtures

    @invalid_attrs %{id: nil, name: nil}

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert Telegram.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert Telegram.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      valid_attrs = %{id: 42, name: "some name"}

      assert {:ok, %Chat{} = chat} = Telegram.create_chat(valid_attrs)
      assert chat.id == 42
      assert chat.name == "some name"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Telegram.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      update_attrs = %{id: 43, name: "some updated name"}

      assert {:ok, %Chat{} = chat} = Telegram.update_chat(chat, update_attrs)
      assert chat.id == 43
      assert chat.name == "some updated name"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = Telegram.update_chat(chat, @invalid_attrs)
      assert chat == Telegram.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = Telegram.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> Telegram.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = Telegram.change_chat(chat)
    end
  end

  describe "chats" do
    alias PapyrusApi.Telegram.Chat

    import PapyrusApi.TelegramFixtures

    @invalid_attrs %{name: nil}

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert Telegram.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert Telegram.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Chat{} = chat} = Telegram.create_chat(valid_attrs)
      assert chat.name == "some name"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Telegram.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Chat{} = chat} = Telegram.update_chat(chat, update_attrs)
      assert chat.name == "some updated name"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = Telegram.update_chat(chat, @invalid_attrs)
      assert chat == Telegram.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = Telegram.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> Telegram.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = Telegram.change_chat(chat)
    end
  end
end
