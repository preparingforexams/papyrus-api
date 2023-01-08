defmodule PapyrusApi.Repo do
  use Ecto.Repo,
    otp_app: :papyrus_api,
    adapter: Ecto.Adapters.Postgres
end
