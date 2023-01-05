defmodule AssignmentFirst.MixProject do
  use Mix.Project

  def project do
    [
      app: :assignment_first,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  defp aliases do
    [
     test: ["test", "ecto.create --quiet", "ecto.migrate"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]


  def application do
    [
      extra_applications: [:plug,
      :logger],
      mod: {AssignmentFirst.Application, []}
    ]
  end



  def deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      # {:dep_from_hexpm, "~> 0.3.0"}
    ]
  end
end
