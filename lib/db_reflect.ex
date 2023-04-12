defmodule DbReflect do
  def greeting do
    # "Welcome to Maxo!"
    SessionRepo.configure(SessionRepo.Psql)
    SessionRepo.get("1")

    SessionRepo.configure(SessionRepo.Mysql)
    SessionRepo.get("1")
  end
end
