defmodule DbReflectTest do
  use ExUnit.Case
  use MnemeDefaults

  test "greeting" do
    auto_assert("Welcome to Maxo!" <- DbReflect.greeting())
  end
end
