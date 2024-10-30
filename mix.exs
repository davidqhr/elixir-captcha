defmodule Captcha.Mixfile do
  use Mix.Project

  def project do
    [app: :captcha,
     version: "0.1.0",
     elixir: "~> 1.9",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:elixir_make, :elixir, :app],
     make_clean: ["clean"],
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/p-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:elixir_make, "~> 0.8", runtime: false}
    ]
  end

  defp description do
    """
    This is a Elixir lib for generating captcha. No dependencies. It drawing captcha image with C code. No ImageMagick, No RMagick.
    """
  end

  defp package do
    [
     name: :captcha,
     files: ["lib", "priv", "mix.exs", "README*", "LICENSE*", "src", "test", "config", "Makefile"],
     maintainers: ["davidqhr"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/davidqhr/elixir-captcha",
              "Docs" => "https://github.com/davidqhr/elixir-captcha"}]
  end
end
