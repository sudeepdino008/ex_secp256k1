defmodule ExSecp256k1.MixProject do
  use Mix.Project

  @version "6.7.1"
  @source_url "https://github.com/sudeepdino008/ex_secp256k1"

  def project do
    [
      app: :ex_secp256k1_rpe,
      name: "ExSecp256k1",
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      deps: deps(),
      docs: docs(),
      package: package(),
      description: description()
    ]
  end

  defp description do
    """
    Rust Nif that wraps functions from the libsecp256k1 Rust library.
    """
  end

  defp package do
    [
      name: :ex_secp256k1_rpe,
      maintainers: ["Ayrat Badykov"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@source_url}/blob/master/CHANGELOG.md",
        "GitHub" => @source_url
      },
      files: [
        "mix.exs",
        "native/exsecp256k1/.cargo/config",
        "native/exsecp256k1/src",
        "native/exsecp256k1/Cargo.toml",
        "native/exsecp256k1/Cargo.lock",
        "checksum-*exs",
        "lib",
        "LICENSE",
        "README.md",
        "CHANGELOG.md"
      ]
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: [
        "CHANGELOG.md",
        "README.md"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.0.1", only: :test},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:rustler, "~> 0.27", optional: true},
      {:rustler_precompiled, "~> 0.6.1"}
    ]
  end
end
