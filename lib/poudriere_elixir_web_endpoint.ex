defmodule PoudriereElixirWeb.Endpoint do
  use Plug.Builder

  @data_dir "/home/poudriere/data/logs/bulk"
  @packages_dir "/home/poudriere/data"
  @shared_dir "/home/poudriere/shared-html"

  #plug Plug.Logger

  plug Plug.Static,
    at: "/data", from: @data_dir
  plug PlugStaticLs,
    at: "/data", from: @data_dir

  plug Plug.Static,
    at: "/packages", from: @packages_dir
  plug PlugStaticLs,
    at: "/packages", from: @packages_dir

  plug Plug.Static.IndexHtml, at: "/"
  plug Plug.Static, at: "/", from: @shared_dir

  plug :not_found
  plug :halt

  def not_found(conn, _) do
    Plug.Conn.send_resp(conn, 404, ["not found"," ", "here"])
  end

  def halt(conn, _) do
    Plug.Conn.halt(conn)
  end

  def init(options) do
    options
  end

  defp get_env(name, defval) do
    Application.get_env(:poudriere_elixir_web, name, defval)
  end

  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http PoudriereElixirWeb.Endpoint, [],
    port: get_env(:port, 8080),
    ip: get_env(:ip, {127, 0, 0, 1})
  end
end
