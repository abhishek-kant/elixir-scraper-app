# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :scraperStore,
  ecto_repos: [ScraperStore.Repo]

# Configures the endpoint
config :scraperStore, ScraperStore.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/e/h672V5Cbn4McRAUosUh2ujO0jpgeqQ674rrQ82PGnBp5JnKWLFa88GQeaCeAD",
  render_errors: [view: ScraperStore.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ScraperStore.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :floki, :html_parser, Floki.HTMLParser.Html5ever


config :exq,
  name: Exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "exq",
  concurrency: 10,
  queues: ["default"],
  poll_timeout: 50,
  scheduler_poll_timeout: 200,
  scheduler_enable: true,
  max_retries: 25,
  shutdown_timeout: 5000

config :hound, driver: "phantomjs"
