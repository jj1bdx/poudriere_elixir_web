# PoudriereElixirWeb

Web server for viewing [Poudriere](https://github.com/freebsd/poudriere) results

# How to run

* Configure IP address and port in `config/` files
* To run the server, do this:

    elixir --detached -S mix do compile, run --no-halt
