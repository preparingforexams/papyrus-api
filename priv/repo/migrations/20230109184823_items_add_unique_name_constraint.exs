defmodule PapyrusApi.Repo.Migrations.ItemsAddUniqueNameConstraint do
  use Ecto.Migration

  def change do
    create(
      unique_index(
        :items,
        :name,
        name: :unique_name_for_item
      )
    )
  end
end
