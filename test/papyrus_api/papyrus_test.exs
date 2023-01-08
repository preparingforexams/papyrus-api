defmodule PapyrusApi.PapyrusTest do
  use PapyrusApi.DataCase

  alias PapyrusApi.Papyrus

  describe "items" do
    alias PapyrusApi.Papyrus.Item

    import PapyrusApi.PapyrusFixtures

    @invalid_attrs %{description: nil, id: nil, name: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Papyrus.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Papyrus.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description", id: 42, name: "some name"}

      assert {:ok, %Item{} = item} = Papyrus.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.id == 42
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Papyrus.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", id: 43, name: "some updated name"}

      assert {:ok, %Item{} = item} = Papyrus.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.id == 43
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Papyrus.update_item(item, @invalid_attrs)
      assert item == Papyrus.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Papyrus.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Papyrus.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Papyrus.change_item(item)
    end
  end

  describe "items" do
    alias PapyrusApi.Papyrus.Item

    import PapyrusApi.PapyrusFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Papyrus.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Papyrus.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Item{} = item} = Papyrus.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Papyrus.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Item{} = item} = Papyrus.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Papyrus.update_item(item, @invalid_attrs)
      assert item == Papyrus.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Papyrus.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Papyrus.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Papyrus.change_item(item)
    end
  end
end
