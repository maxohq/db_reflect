defmodule DbReflect.MixProject do
  use Mix.Project
  @github_url "https://github.com/maxohq/db_reflect"
  @version "0.1.0"
  @description "DbReflect description"

  def project do
    [
      app: :db_reflect,
      source_url: @github_url,
      version: @version,
      description: @description,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      test_paths: ["test", "lib"],
      test_pattern: "*_test.exs",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {DbReflect.Application, []}
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do: ["lib"]

  defp package do
    [
      files: ~w(lib mix.exs README* CHANGELOG*),
      licenses: ["MIT"],
      links: %{
        "Github" => @github_url,
        "Changelog" => "#{@github_url}/blob/main/CHANGELOG.md"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:maxo_adapt, "~> 0.1"},

      # DB drivers
      {:postgrex, "~> 0.17", optional: true},
      {:myxql, "~> 0.6.3", optional: true},
      {:exqlite, "~> 0.13", optional: true},

      # Dev tools
      {:ex_check, "~> 0.15", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:doctor, ">= 0.0.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},

      # Testing tools
      {:maxo_test_iex, "~> 0.1", only: [:test]},
      {:mneme, "~> 0.3", only: [:test]}
    ]
  end
end
