defmodule DirP.Root.Insurance.Quote do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://sandbox.root.co.za/v1/insurance"
  plug Tesla.Middleware.BasicAuth, username: "sandbox_NzhmM2M0MTgtYmVjNC00ZDQ4LWE0ODgtZWFhMDBhOWZmZTgxLmdDaFFzOVdRN1U1R28tT0N4UTl4bS1QTHJhaHo5VXI4", password: ""
  plug Tesla.Middleware.JSON

  def create(data) do
    post("/quotes", data)
  end
end
