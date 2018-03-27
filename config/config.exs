# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dirp,
  ecto_repos: [DirP.Repo]

# Configures the endpoint
config :dirp, DirPWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l38Z74vTwVmzms0XDxiJwwsvFmN0T8A5/gTkYYJds69H3pg8iPlwIJXczDSSMLwC",
  render_errors: [view: DirPWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DirP.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"