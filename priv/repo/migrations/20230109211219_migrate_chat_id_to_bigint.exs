defmodule PapyrusApi.Repo.Migrations.MigrateChatIdToBigint do
  use Ecto.Migration

  def change do
    alter table(:chats) do
      modify :id, :bigint
    end
  end
end
