defmodule SessionRepo.Psql do
  @behaviour SessionRepo

  @impl SessionRepo
  def get(_token), do: {:ok, %Session{id: 1, source: "psql"}}
end
