defmodule DbReflect.Driver.Psql do
  def params do
    [
      hostname: "127.0.0.1",
      username: "postgres",
      password: "postgres",
      database: "db_reflect",
      port: "6661"
    ]
  end

  def start do
    ensure_started()

    with {:ok, pid} <- Postgrex.start_link(params()) do
      {:ok, pid}
    end
  end

  def check(pid) do
    Postgrex.query!(
      pid,
      "drop table if exists comments;",
      []
    )

    Postgrex.query!(
      pid,
      "create table comments(id serial primary key not null, text varchar)",
      []
    )

    Postgrex.query!(pid, "insert into comments(text) values('first!')", [])
    Postgrex.query!(pid, "SELECT * FROM comments", [])
  end

  defp ensure_started do
    :application.ensure_all_started(:postgrex)
  end
end
