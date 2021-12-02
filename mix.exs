defmodule NodePing.MixProject do
  use Mix.Project

  def project do
    [
      app: :nodeping,
      version: "1.3.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "NodePing Elixir",
      source_url: "https://github.com/stratacast/nodeping_elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "An Elixir package for managing checks, schedules, contacts, etc. on your NodePing account."
  end

  defp package() do
    [
      files: ~w(lib LICENSE mix.exs README.adoc),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/stratacast/nodeping_elixir"}
    ]
  end
end
