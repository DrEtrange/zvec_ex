defmodule Zvec.MixProject do
  use Mix.Project

  @version "0.3.0"
  @source_url "https://github.com/nyo16/zvec_ex"

  def project do
    [
      app: :zvec,
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_env: fn -> %{"FINE_INCLUDE_DIR" => Fine.include_dir()} end,
      deps: deps(),
      package: package(),
      description: "Elixir NIF bindings for zvec, an in-process vector database from Alibaba.",
      source_url: @source_url,
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Zvec.Application, []}
    ]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.9", runtime: false},
      {:fine, "~> 0.1.4", runtime: false},
      {:ex_doc, "~> 0.35", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url,
        "zvec" => "https://github.com/alibaba/zvec"
      },
      files: ~w(lib c_src/zvec_nif.cpp Makefile mix.exs README.md LICENSE .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE"],
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end
end
