defmodule PoudriereElixirWeb do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(PoudriereElixirWeb.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: PoudriereElixirWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
