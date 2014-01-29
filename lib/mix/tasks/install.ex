defmodule Mix.Tasks.Install do
  use Mix.Task

  def run(_) do
    Wwweaver.Database.Create.run
  end
end
