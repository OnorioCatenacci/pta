defmodule Pta.Web.Schema do
  use Absinthe.Schema
  alias Pta.Event.Performance
  import Ecto.Query
  alias Pta.Repo
  import_types(Absinthe.Type.Custom)

  query do
    field :performances, list_of(:performance) do
      arg(:performance_date, :string)

      resolve(fn _, %{performance_date: performance_date}, _ ->
        {:ok, date_for_query} = Date.from_iso8601(performance_date)

        q =
          from p in Performance,
            where: p.date == ^date_for_query,
            select: %Performance{
              id: p.id,
              name: p.name,
              date: p.date,
              performer: p.performer,
              start_time: p.start_time
            }

        {:ok, Repo.all(q)}
      end)

      resolve(fn _, _, _ ->
        q =
          from p in Performance,
            select: %Performance{
              id: p.id,
              name: p.name,
              date: p.date,
              performer: p.performer,
              start_time: p.start_time
            }

        {:ok, Repo.all(q)}
      end)
    end
  end

  @desc "A performance at a specific venue"
  object :performance do
    field :id, :id
    @desc "The name of the performance"
    field :name, :string
    @desc "The date of the performance"
    field :date, :date
    @desc "The name of the performer or performers"
    field :performer, :string
    @desc "The time of the start of the performance (Eastern Standard Time)"
    field :start_time, :time
  end
end
