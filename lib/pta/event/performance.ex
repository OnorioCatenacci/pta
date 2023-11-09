defmodule Pta.Event.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performances" do
    field :name, :string
    field :date, :date
    field :performer, :string
    field :start_time, :time
    field :event_hash, :string
    field :venue_id, :id

    timestamps()
  end

  @doc false
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [:name, :performer, :date, :start_time, :event_hash])
    |> validate_required([:name, :performer, :date, :start_time, :event_hash])
  end
end