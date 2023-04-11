defmodule DbReflect.Driver.Psql do
  def start do
    ensure_started()

    {:ok, pid} =
      Postgrex.start_link(
        hostname: "127.0.0.1",
        username: "postgres",
        password: "postgres",
        database: "db_reflect",
        port: "6661"
      )

    pid
  end

  defp ensure_started do
    :application.ensure_all_started(:postgrex)
  end
end
