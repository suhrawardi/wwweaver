defmodule Wwweaver.Mixfile do
  use Mix.Project

  def project do
    [ app: :wwweaver,
      version: "0.0.1",
      elixir: "~> 0.12.2",
      elixirc_paths: ["lib"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:httpotion]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:httpotion, "0.2.3", github: "myfreeweb/httpotion"},
      {:amnesia, github: "meh/amnesia"}
    ]
  end
end
