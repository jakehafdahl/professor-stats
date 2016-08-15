# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the namespace used by Phoenix generators
config :professor_stats_web,
  app_namespace: ProfessorStats.Web

# Configures the endpoint
config :professor_stats_web, ProfessorStats.Web.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "btwABvrCV8A4VWKvu6g6VsVM20FJ7cjnOM7vjyonSeNXjPgBoKV5kFORSpkLaMkQ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ProfessorStats.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
