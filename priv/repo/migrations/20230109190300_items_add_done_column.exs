defmodule PapyrusApi.Repo.Migrations.ItemsAddDoneColumn do
  use Ecto.Migration

  def change do
    alter table("items") do
      add :done, :bool, default: false
    end
  end
end
