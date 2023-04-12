defmodule SessionRepo.Mysql do
  @behaviour SessionRepo

  @impl SessionRepo
  def get(_token), do: {:ok, %Session{id: 2, source: "mysql"}}
end
