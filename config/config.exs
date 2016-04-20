# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :pendrell_vale, PendrellVale.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "SqA7lJ2oUqqQDelWtYGt9ZuOonez7HS5SV3WyPo1waGK3+jeduWDsOaL50mqIb4X",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: PendrellVale.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "MyApp",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "SqA7lJ2oUqqQDelWtYGt9ZuOonez7HS5SV3WyPo1waGK3+jeduWDsOaL50mqIb4X",
  serializer: PendrellVale.GuardianSerializer

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
