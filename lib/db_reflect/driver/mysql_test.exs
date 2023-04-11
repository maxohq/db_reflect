defmodule DbReflect.Driver.MysqlTest do
  use ExUnit.Case
  use MnemeDefaults
  alias DbReflect.Driver.Mysql

  test "check" do
    {:ok, pid} = Mysql.start()

    auto_assert(
      %MyXQL.Result{
        columns: ["id", "text"],
        connection_id: 1,
        num_rows: 1,
        num_warnings: 0,
        rows: [[1, "first!"]]
      } <- Mysql.check(pid) |> clean_result()
    )
  end

  defp clean_result(result) do
    Map.put(result, :connection_id, 1)
  end
end
