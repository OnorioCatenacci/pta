defmodule Pta.Web.Schema do
  use Absinthe.Schema
  alias Pta.Event.Performance
  import Ecto.Query
  alias Pta.Repo
  import_types Absinthe.Type.Custom

  query do
    field :performances, list_of(:performance) do
      resolve fn _, _, _ ->
        q = from p in Performance,
        select: %Performance{
          id: p.id,
          name: p.name,
          date: p.date,
          performer: p.performer,
          start_time: p.start_time
        }

        {:ok, Repo.all(q)}
      end
    end
  end

  object :performance do
    field :id, :id
    field :name, :string
    field :date, :date
    field :performer, :string
    field :start_time, :time
  end
end
