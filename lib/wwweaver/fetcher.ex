defmodule Wwweaver.Fetcher do

  alias HTTPotion.Response

  @user_agent ["User-agent": "Eix suhrawardi@gmail.com"]

  def get(url) do
    case HTTPotion.get(url, @user_agent) do
      Response[body: body, status_code: status, headers: _headers]
      when status in 200..299 ->
        {:ok, body}
      Response[body: body, status_code: status, headers: _headers] ->
        {:error, status}
    end
  end
end
