use Mix.Config

config :poudriere_elixir_web,
  ip: {127, 0, 0, 1},
  port: 8080

import_config "#{Mix.env}.exs"

# You can configure for your application as:
#
#     config :poudriere_elixir_web, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:poudriere_elixir_web, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
