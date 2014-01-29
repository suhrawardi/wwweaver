use Amnesia
use Wwweaver.Database

defmodule Wwweaver.Process do

  def start(uri, fun) do
    Wwweaver.Database.initialize
    Amnesia.start
    crawl(uri, fun)
    Amnesia.stop
  end

  defp crawl(uri, fun) do
    unless Wwweaver.Page.exists?({:uri, uri}) do
      Wwweaver.Page.add_uri(uri)
      Wwweaver.Fetcher.get(uri)
        |> fun.(uri)
        |> continue(uri, fun)
    end
  end

  defp branch([head|tail], orig_uri, dir) do
    uri = full_url(head, orig_uri)
    parsed_orig_uri = URI.parse(orig_uri)
    parsed_uri = URI.parse(uri)
    if parsed_uri.host == parsed_orig_uri.host do
      crawl(uri, dir)
    end
    branch(tail, orig_uri, dir)
  end

  defp branch(_, _, _) do
  end

  defp continue({:ok, html}, uri, fun) do
    links = extract_urls_from_html(html)
    branch(links, uri, fun)
  end

  defp continue({:error, status}, uri, _) do
    IO.puts "Can't continue from #{uri} (#{status})"
  end

  defp full_url(uri, orig_uri) do
    p = URI.parse(uri)
    if p.host == nil do
      orig_p = URI.parse(orig_uri)
      uri = "#{orig_p.scheme}://#{orig_p.host}:#{orig_p.port}#{p.path}"
    end
    uri
  end

  defp extract_urls_from_html(html) do
    {_, pattern} = Regex.compile("<a.+href=\"([^\"]+)\".+>[^<]+</a>")
    filter_urls(Regex.scan(pattern, html))
  end

  defp filter_urls(list) do
    Enum.map(list, &extract_match/1)
  end

  defp extract_match(list) do
    case list do
      [_all, match] -> match
      _             -> nil
    end
  end
end
