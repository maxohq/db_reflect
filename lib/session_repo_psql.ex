defmodule SessionRepo.Psql do
  @behaviour SessionRepo

  @impl SessionRepo
  def get("1"), do: {:ok, %Session{id: 1, source: "psql"}}
  def get(_), do: {:error, :not_found}
end
