use Mix.Config

# For configuring IP address and TCP port number,
# use the parameters for :poudriere_elixir_web

config :poudriere_elixir_web,
  ip: {127, 0, 0, 1},
  port: 8080

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).

import_config "#{Mix.env}.exs"
