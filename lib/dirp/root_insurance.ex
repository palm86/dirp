defmodule DirP.Root.Insurance do
  require Tesla

  def client() do
    api_key =
      Path.expand("~")
      |> Path.join(".apikey")
      |> IO.inspect()
      |> File.read!()

    Tesla.build_client([
      {Tesla.Middleware.BasicAuth, username: api_key, password: ""}
    ])
  end
end
