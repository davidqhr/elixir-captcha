defmodule Mix.Tasks.Compile.Make do
  def run(_) do
    {result, _error_code} = System.cmd("make", [], stderr_to_stdout: true)
    Mix.shell.info result

    :ok
  end
end

defmodule Mix.Tasks.Clean.Make do
  def run(_) do
    {result, _error_code} = System.cmd("make", ['clean'], stderr_to_stdout: true)
    Mix.shell.info result

    :ok
  end
end

defmodule Captcha.Mixfile do
  use Mix.Project

  def project do
    [app: :captcha,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:make, :elixir, :app],
     description: description(),
     aliases: aliases(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
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
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp aliases do
    [clean: ["clean", "clean.make"]]
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
