defmodule Wwweaver.Database.Destroy do
  use Wwweaver.Database

  def run do
    # Start mnesia, or we can't do much.
    Amnesia.start

    # Destroy the database.
    Wwweaver.Database.destroy

    # Stop mnesia, so it flushes everything.
    Amnesia.stop

    # Destroy the schema for the node.
    Amnesia.Schema.destroy
  end
end
