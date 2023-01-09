defmodule PapyrusApi.Papyrus.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string # optional
    field :name, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :done])
    |> unique_constraint(:name, name: :unique_name_for_item)
    |> validate_required([:name])
  end
end
