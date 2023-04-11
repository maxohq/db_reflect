defmodule DbReflect.Driver.Mysql do
  def params do
    [
      username: "root",
      password: "mysql",
      port: 6662,
      hostname: "127.0.0.1",
      database: "db_reflect",
      protocol: :tcp
    ]
  end

  def start do
    ensure_started()

    with {:ok, pid} <- MyXQL.start_link(params()) do
      {:ok, pid}
    end
  end

  def check(pid) do
    MyXQL.query!(
      pid,
      "drop table if exists comments;",
      []
    )

    MyXQL.query!(
      pid,
      "create table if not exists comments(id int primary key not null auto_increment, text varchar(100))",
      []
    )

    MyXQL.query!(pid, "insert into comments(text) values('first!')", [])
    MyXQL.query!(pid, "SELECT * FROM comments", [])
  end

  defp ensure_started do
    :application.ensure_all_started(:myxql)
  end
end
