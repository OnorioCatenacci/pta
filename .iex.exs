import Ecto.Query

defmodule EctoHelpers.Pta do
  @moduledoc """
  This is a quick and easy way to allow me to run interactive queries from
  within iex.  This allows me to quickly confirm that I've gotten my Ecto query
  correct.

  ## Examples
  To use this:

  iex -S mix

  iex(1)> use EctoHelpers.Pta

  iex(2)> query = from v in Venue,
         select: [v.id, v.name]

  iex(3)> Repo.all(query)
  """
  defmacro __using__(_) do
    quote do
      Pta.Repo.start_link(
        name: :pta,
        adapter: Ecto.Adapters.Postgres,
        hostname: "localhost",
        username: "postgres",
        password: "postgres",
        database: "pta_dev",
        pool_size: 20,
        queue_target: 5000,
        ssl: false,
        read_only: true
      )

      Pta.Repo.put_dynamic_repo(:pta)
      alias Pta.Repo, as: Repo

      alias Pta.Event.{
        Venue,
        Performance
      }
    end
  end
end
