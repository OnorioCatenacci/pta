defmodule Pta.EventFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pta.Event` context.
  """

  @doc """
  Generate a venue.
  """
  def venue_fixture(attrs \\ %{}) do
    {:ok, venue} =
      attrs
      |> Enum.into(%{
        address: "some address",
        city: "some city",
        name: "some name",
        state: "some state",
        zip: "some zip"
      })
      |> Pta.Event.create_venue()

    venue
  end

  @doc """
  Generate a performance.
  """
  def performance_fixture(attrs \\ %{}) do
    {:ok, performance} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-11-08],
        name: "some name",
        performer: "some performer",
        start_time: ~T[14:00:00],
        venue_id: 1
      })
      |> Pta.Event.create_performance()

    performance
  end
end
