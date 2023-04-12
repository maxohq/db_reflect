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
    Postgrex.start_link(params())
  end

  def queries do
    # - https://github.com/vrana/adminer/blob/master/adminer/drivers/pgsql.inc.php
    # SELECT datname FROM pg_database WHERE has_database_privilege(datname, 'CONNECT') ORDER BY datname
  end

  def check(pid) do
    query!(pid, "drop table if exists comments")
    query!(pid, "create table comments(id serial primary key not null, text varchar)")
    query!(pid, "insert into comments(text) values('first!')")
    query!(pid, "SELECT * FROM comments")

    query!(
      pid,
      "SELECT datname FROM pg_database WHERE has_database_privilege(datname, 'CONNECT') ORDER BY datname"
    )

    query!(
      pid,
      "SELECT *, table_name, table_type FROM information_schema.tables where table_schema = 'public'"
    )
  end

  def query!(pid, sql, args \\ []) do
    Postgrex.query!(pid, sql, args)
  end

  defp ensure_started do
    :application.ensure_all_started(:postgrex)
  end
end
