# PoudriereElixirWeb

Web server for viewing [Poudriere](https://github.com/freebsd/poudriere) results

# How to run

* Copy static files of Poudriere to `/home/poudriere/static-html', by:

        mkdir /home/poudriere/static-html
        cp -pr /usr/local/share/poudriere/html/* /home/poudriere/static-html

* Configure IP address and port in `config/` files at `config/dev.exs` and `config/prod.exs`

* To run the server, do this:

        elixir --detached -S mix do compile, run --no-halt

# Building release

        mix do deps.get, compile
        MIX_ENV=prod mix release
        rel/poudriere_elixir_web/bin/poudriere_elixir_web start

# Notes

* Conform hasn't been included yet: use `config` files

