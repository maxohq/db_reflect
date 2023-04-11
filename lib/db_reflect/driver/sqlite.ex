defmodule DbReflect.Driver.Sqlite do
  def start do
    # - https://github.com/elixir-sqlite/exqlite/blob/main/lib/exqlite/basic.ex
    # We'll just keep it in memory right now
    {:ok, conn} = Exqlite.Basic.open("file:blah?mode=memory&cache=shared")
    Exqlite.Basic.exec(conn, "create table test (id integer primary key, stuff text)")
    Exqlite.Basic.exec(conn, "insert into test(id, stuff) values (?, ?)", [1, "first"])
    Exqlite.Basic.exec(conn, "select * from test")

    # open another connection to that same in-memory DB
    {:ok, conn2} = Exqlite.Basic.open("file:blah?mode=memory&cache=shared")
    Exqlite.Basic.exec(conn2, "select * from test")

    # open yet another in-memory connection, but now it's fresh and does not have any tables!
    {:ok, conn3} = Exqlite.Basic.open("file:boom?mode=memory&cache=shared")
    Exqlite.Basic.exec(conn3, "select * from test")
  end

  # - https://github.com/vrana/adminer/blob/master/adminer/drivers/sqlite.inc.php
  # PRAGMA table_info(users);
  # SELECT * FROM sqlite_master;
  # PRAGMA index_list(users);
  # PRAGMA foreign_key_list(users);
  def queries do
  end
end
