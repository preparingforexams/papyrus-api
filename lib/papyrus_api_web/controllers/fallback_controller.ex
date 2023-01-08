defmodule PapyrusApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use PapyrusApiWeb, :controller

  def handle_errors(
        conn,
        %{
          reason: %Phoenix.Router.NoRouteError{
            message: message
          }
        }
      ) do
    conn
    |> json(%{error: message})
    |> halt()
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(PapyrusApiWeb.ErrorView)
    |> render(:"404")
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PapyrusApiWeb.ChangesetView, "error.json", changeset: changeset)
  end
end
