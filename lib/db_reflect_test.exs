defmodule DbReflectTest do
  use ExUnit.Case
  use MnemeDefaults

  test "greeting" do
    auto_assert({:ok, %Session{id: 2, source: "mysql"}} <- DbReflect.greeting())
  end
end
