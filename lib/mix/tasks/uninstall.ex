defmodule Mix.Tasks.Uninstall do
  use Mix.Task

  def run(_) do
    Wwweaver.Database.Destroy.run
  end
end
