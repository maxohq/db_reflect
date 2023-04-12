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
    MyXQL.start_link(params())
  end

  def queries do
    # https://github.com/vrana/adminer/blob/master/adminer/drivers/mysql.inc.php
  end

  def check(pid) do
    query!(pid, "drop table if exists comments;")

    query!(
      pid,
      "create table if not exists comments(id int primary key not null auto_increment, text varchar(100))"
    )

    query!(pid, "insert into comments(text) values('first!')", [])
    query!(pid, "SELECT * FROM comments", [])
  end

  def query!(pid, sql, args \\ []) do
    MyXQL.query!(pid, sql, args)
  end

  defp ensure_started do
    :application.ensure_all_started(:myxql)
  end
end
