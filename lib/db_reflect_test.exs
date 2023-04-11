defmodule DbReflectTest do
  use ExUnit.Case
  use MnemeDefaults

  test "greeting" do
    auto_assert(DbReflect.greeting())
  end
end
