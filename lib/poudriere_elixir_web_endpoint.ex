defmodule PoudriereElixirWeb.Endpoint do
  use Plug.Builder

  #plug Plug.Logger

  plug Plug.Static,
    at: "/data", from: "/home/poudriere/data/logs/bulk"
  plug PlugStaticLs,
    at: "/data", from: "/home/poudriere/data/logs/bulk"

  plug Plug.Static,
    at: "/packages", from: "/home/poudriere/data"
  plug PlugStaticLs,
    at: "/packages", from: "/home/poudriere/data"

  plug Plug.Static.IndexHtml, at: "/"
  plug Plug.Static,
    at: "/", from: "/home/poudriere/shared-html", gzip: false

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

  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http PoudriereElixirWeb.Endpoint, [],
      port: 8080
      #ip: {127, 0, 0, 1} # set your own IP
  end
end
