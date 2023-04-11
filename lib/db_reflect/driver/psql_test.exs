defmodule DbReflect.Driver.PsqlTest do
  use ExUnit.Case
  use MnemeDefaults
  alias DbReflect.Driver.Psql

  test "check" do
    {:ok, pid} = Psql.start()

    auto_assert(
      %Postgrex.Result{
        columns: [
          "table_catalog",
          "table_schema",
          "table_name",
          "table_type",
          "self_referencing_column_name",
          "reference_generation",
          "user_defined_type_catalog",
          "user_defined_type_schema",
          "user_defined_type_name",
          "is_insertable_into",
          "is_typed",
          "commit_action",
          "table_name",
          "table_type"
        ],
        command: :select,
        connection_id: 1,
        messages: [],
        num_rows: 1,
        rows: [
          [
            "db_reflect",
            "public",
            "comments",
            "BASE TABLE",
            nil,
            nil,
            nil,
            nil,
            nil,
            "YES",
            "NO",
            nil,
            "comments",
            "BASE TABLE"
          ]
        ]
      } <- Psql.check(pid) |> clean_result()
    )
  end

  defp clean_result(result) do
    Map.put(result, :connection_id, 1)
  end
end
