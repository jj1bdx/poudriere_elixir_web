defmodule PoudriereElixirWeb.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :poudriere_elixir_web,
     version: @version,
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     description: "Web server for viewing Poudriere results in Elixir and Plug",
     name: "Poudriere_Elixir_Web",
     source_url: "https://github.com/jj1bdx/poudriere_elixir_web",
     homepage_url: "http://github.com/jj1bdx/poudriere_elixir_web",
     docs: [extras: ["README.md"], main: "readme",
            source_ref: "v#{@version}",
            source_url: "https://github.com/jj1bdx/poudriere_elixir_web"],
     dialyzer: [plt_add_deps: :transitive,
                flags: ["-Wunmatched_returns","-Werror_handling","-Wrace_conditions", "-Wno_opaque"]]]
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["Kenji Rikitake"],
     links: %{"GitHub" => "https://github.com/jj1bdx/poudriere_elixir_web"}]
  end

  def application do
    [mod: {PoudriereElixirWeb, []},
    applications: [:plug, :cowboy, :logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "server-example", "test/support"]
  defp elixirc_paths(_), do: ["lib", "server-example"]

  defp deps do
    [
      {:plug_static_ls, "~> 0.6.0"},
      {:plug_static_index_html, "~> 0.1.2"},
      {:plug, "~> 1.3"},
      {:cowboy, "~> 1.0"},
      {:ex_doc, "~> 0.14", only: :dev},
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false}
    ]
  end

end
