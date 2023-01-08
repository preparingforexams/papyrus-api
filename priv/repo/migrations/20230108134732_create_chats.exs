defmodule PapyrusApi.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string

      timestamps()
    end
  end
end
