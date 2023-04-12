# Decompiled module for the default, unconfigured module for `adapter` package
# - it allows `mix test --cover` to finish properly
# Otherwise it fails with
# ** (MatchError) no match of right hand side value: {:error, {:no_source_code_found, Adapter.SessionRepo}}
#     (mix 1.14.2) lib/mix/tasks/test.coverage.ex:290: anonymous fn/3 in Mix.Tasks.Test.Coverage.html/2
#     (elixir 1.14.2) lib/enum.ex:2468: Enum."-reduce/3-lists^foldl/2-0-"/3
#     (mix 1.14.2) lib/mix/tasks/test.coverage.ex:289: Mix.Tasks.Test.Coverage.html/2
#     (mix 1.14.2) lib/mix/tasks/test.ex:549: Mix.Tasks.Test.do_run/3
#     (mix 1.14.2) lib/mix/task.ex:421: anonymous fn/3 in Mix.Task.run_task/4
#     (mix 1.14.2) lib/mix/cli.ex:84: Mix.CLI.run_task/2
#     (elixir 1.14.2) lib/code.ex:1260: Code.require_file/2
defmodule Adapter.SessionRepo do
  def get(_token) do
    Enum.random(error: :session_repo_not_configured)
  end
end
