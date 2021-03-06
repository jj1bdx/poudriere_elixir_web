# PoudriereElixirWeb

Web server for viewing [Poudriere](https://github.com/freebsd/poudriere) results

## Configuration requirements

### Static contents served

Poudriere requires the following contents to be served:

* Static contents of Poudriere itself in `/` at: `/home/poudriere/static-html` with*out* directory index;
* Logs in `/data` at: `/home/poudriere/data/logs/bulk` with directory index; and
* Packages in `/packages` at: `/home/poudriere/data` with directory index.

### MIME type configuration

Poudriere needs the following MIME types to be served:

```
text/plain                          txt log;
```

The above type is already specified in the MIME module of Elixir.

### Server code

See `lib/poudriere_elixir_web_endpoint.ex`.

### Serving the logs

* Logs must be served as static contents/assets, so use `Plug.Static`.
* Logs must be served with directory index enabled, so use `PlugStaticLs`.
* *Use the same configuration between `Plug.Static` and `PlugStaticLs`.*

```elixir
plug Plug.Static,
  at: "/data", from: "/home/poudriere/data/logs/bulk"
plug PlugStaticLs,
  at: "/data", from: "/home/poudriere/data/logs/bulk"
```

### Serving the packages

* Packages must be served as static contents/assets, so use `Plug.Static`.
* Packages must be served with directory index enabled, so use `PlugStaticLs`.
* *Use the same configuration between `Plug.Static` and `PlugStaticLs`.*

```elixir
plug Plug.Static,
  at: "/packages", from: "/home/poudriere/data"
plug PlugStaticLs,
  at: "/packages", from: "/home/poudriere/data"
```

### Serving the document root

* The directory path must be redirected to the `index.html` file of the same directory, so use `Plug.Static.IndexHtml`. (Note that `Plug.Static.IndexHtml` is an *independent* package/module from `Plug` or `Plug.Static`.)
* The directory contents must be served as static contents/assets, so use `Plug.Static`.
* The files must not be indexed.

```elixir
plug Plug.Static.IndexHtml, at: "/"
plug Plug.Static, at: "/", from: "/home/poudriere/static-html"
```

### Responding to unknown paths

Use the following code:

```elixir
plug :not_found
plug :halt

def not_found(conn, _) do
  Plug.Conn.send_resp(conn, 404, ["not found"," ", "here"])
end

def halt(conn, _) do
  Plug.Conn.halt(conn)
end
```

## How to run

* Copy shared static files of Poudriere to `/home/poudriere/shared-html`, by:

```sh
umask 022 # required to provide world-readable access
mkdir /home/poudriere/shared-html
cp -pr /usr/local/share/poudriere/html/* /home/poudriere/shared-html
```

* Configure IP address and port in `config/dev.exs`, and copy the file to `config/prod.exs`

* To run the server, do this:

```sh
elixir --detached -S mix do compile, run --no-halt
```

## Building and testing Elixir release

```sh
mix do deps.get, compile
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
rel/poudriere_elixir_web/bin/poudriere_elixir_web start
```

## Notes

* Conform hasn't been included yet: use `config` files

## References

* [How To Set Up a Poudriere Build System to Create Packages for your FreeBSD Servers](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-poudriere-build-system-to-create-packages-for-your-freebsd-servers)
* [Poudriere at GitHub](https://github.com/freebsd/poudriere)

