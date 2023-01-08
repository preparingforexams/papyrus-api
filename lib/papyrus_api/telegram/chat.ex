defmodule PapyrusApi.Telegram.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  @derive {Phoenix.Param, key: :id}
  schema "chats" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
