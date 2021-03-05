# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :desafio_contai,
  ecto_repos: [DesafioContai.Repo]

# Configures the endpoint
config :desafio_contai, DesafioContaiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zej+0yg2WMQDzOkaYxYJZwDWJHbn7mwQCAkYPctpxTT8E8Zd/nCsFU6RZRlvbmd1",
  render_errors: [view: DesafioContaiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DesafioContai.PubSub,
  live_view: [signing_salt: "I03D3fRq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :desafio_contai, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: DesafioContaiWeb.Router,
      endpoint: DesafioContaiWeb.Endpoint
    ]
  }
config :phoenix_swagger, json_library: Jason
# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
