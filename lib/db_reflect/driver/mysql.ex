defmodule DbReflect.Driver.Mysql do
  def start do
    ensure_started()

    {:ok, pid} =
      MyXQL.start_link(
        username: "root",
        password: "mysql",
        port: 6662,
        hostname: "127.0.0.1",
        database: "db_reflect",
        protocol: :tcp
      )

    pid
  end

  defp ensure_started do
    :application.ensure_all_started(:myxql)
  end
end
