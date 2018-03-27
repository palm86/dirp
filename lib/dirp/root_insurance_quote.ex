defmodule DirP.Root.Insurance.Quote do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://sandbox.root.co.za/v1/insurance"
  plug Tesla.Middleware.JSON

  def create(client, data) do
    post(client, "/quotes", data)
  end
end
