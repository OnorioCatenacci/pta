defmodule Pta.Event.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "performances" do
    field :name, :string
    field :date, :date
    field :performer, :string
    field :start_time, :time
    field :event_hash, :string
    belongs_to :venue, Pta.Event.Venue

    timestamps()
  end

  @doc false
  def changeset(performance, attrs) do
    performance
    |> cast(attrs, [:name, :performer, :date, :start_time])
    |> validate_required([:name, :performer, :date, :start_time])
  end
end
