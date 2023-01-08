defmodule PapyrusApi.Papyrus.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string # optional
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description])
    |> unique_constraint(:name)
    |> validate_required([:name])
  end
end
