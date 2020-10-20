# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :just_a_sandbox,
  ecto_repos: [JustASandbox.Repo]

# Configures the endpoint
config :just_a_sandbox, JustASandboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EMEKxkS+wGSBKuH1d+WV5GIbcIGSorKOLiU8lzQQikxzTFSz354UYq/waWToy16i",
  render_errors: [view: JustASandboxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JustASandbox.PubSub,
  live_view: [signing_salt: "ffdcMP+j"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
