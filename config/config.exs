# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tumblr,
  ecto_repos: [Tumblr.Repo]

# Configures the endpoint
config :tumblr, Tumblr.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U1u4wfFezG2qYp2GOiKzGvv23oCBfn15MMXC9PBxZsCYYzx3tz2pZm7sZhr5iGsD",
  render_errors: [view: Tumblr.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tumblr.PubSub,
           adapter: Phoenix.PubSub.PG2]


config :ex_admin,
   repo: Tumblr.Repo,
   module: Tumblr,
   modules: [
     Tumblr.ExAdmin.Dashboard,
     Tumblr.ExAdmin.Post,
   ]
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}
