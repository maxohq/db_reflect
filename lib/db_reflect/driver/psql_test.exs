defmodule DbReflect.Driver.PsqlTest do
  use ExUnit.Case
  use MnemeDefaults
  alias DbReflect.Driver.Psql

  test "check" do
    {:ok, pid} = Psql.start()

    auto_assert(
      %Postgrex.Result{
        columns: ["id", "text"],
        command: :select,
        connection_id: 1,
        messages: [],
        num_rows: 1,
        rows: [[1, "first!"]]
      } <- Psql.check(pid) |> clean_result()
    )
  end

  defp clean_result(result) do
    Map.put(result, :connection_id, 1)
  end
end
