defmodule DirPWeb.Router do
  use DirPWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", DirPWeb do
    pipe_through :api

    post "/get_quote", FulfillmentController, :handle_fulfillment
  end
end
