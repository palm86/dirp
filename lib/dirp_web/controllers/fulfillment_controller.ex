defmodule DirPWeb.FulfillmentController do
  use DirPWeb, :controller

  def handle_fulfillment(conn, %{"result" => %{"parameters" => data}}) do
    data =
      data
      |> Map.put("type", "root_funeral") # update the map with the type
      |> Map.put("cover_amount", data["cover_amount_cents"] * 100) # convert the cents to R
      |> Map.take(["cover_amount", "has_spouse", "number_of_children", "type"]) # Take only the allowed fields

    response =
      DirP.Root.Insurance.client()
      |> DirP.Root.Insurance.Quote.create(data)

    suggested_premium =
      response.body
      |> List.first()
      |> Map.fetch!("suggested_premium")
      |> Integer.to_string()
      |> String.split_at(-2)
      |> Tuple.to_list()
      |> Enum.join(".")

    json conn, %{
      speech: "Your quote is R#{suggested_premium}!"
    }
  end
end
