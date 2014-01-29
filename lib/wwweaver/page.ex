use Amnesia
use Wwweaver.Database

defmodule Wwweaver.Page do

  def add_uri(url) do
    Amnesia.transaction! do
      MPage[uri: url].write
    end
  end

  def exists?(prms) do
    find(prms) != nil
  end

  defp find({field, value}) do
    Amnesia.transaction! do
      MPage.read_at(value, field)
    end
  end
end
