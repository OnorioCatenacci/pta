defmodule Pta.Repo.Migrations.CreatePerformances do
  use Ecto.Migration

  def change do
    create table(:performances) do
      add :name, :string
      add :performer, :string
      add :date, :date
      add :start_time, :time
      add :event_hash, :binary
      add :venue_id, references(:venues, on_delete: :nothing)

      timestamps()
    end

    create index(:performances, [:venue_id])
  end
end
