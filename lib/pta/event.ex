defmodule Pta.Event do
  @moduledoc """
  The Event context.
  """

  import Ecto.Query, warn: false
  alias Pta.Repo

  alias Pta.Event.Venue

  Module.register_attribute(__MODULE__, :no_city, persist: true)
  Module.register_attribute(__MODULE__, :no_zip, persist: true)

  @no_city ""
  @no_zip ""

  @doc """
  Returns the list of venues.

  ## Examples

      iex> list_venues()
      [%Venue{}, ...]

  """
  def list_venues do
    Repo.all(Venue)
  end

  def list_venues(filter) when is_map(filter) do
    from(
      Venue
      |> filter_by_city(filter)
      |> filter_by_zip(filter)
    )
    |> Repo.all()
  end

  defp filter_by_city(query, %{city: @no_city}), do: query

  defp filter_by_city(query, %{city: city}) do
    where(query, city: ^city)
  end

  defp filter_by_zip(query, %{zip: @no_zip}), do: query

  defp filter_by_zip(query, %{zip: zip}) do
    where(query, zip: ^zip)
  end

  @doc """
  Gets a single venue.

  Raises `Ecto.NoResultsError` if the Venue does not exist.

  ## Examples

      iex> get_venue!(123)
      %Venue{}

      iex> get_venue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venue!(id), do: Repo.get!(Venue, id)

  @doc """
  Creates a venue.

  ## Examples

      iex> create_venue(%{field: value})
      {:ok, %Venue{}}

      iex> create_venue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venue(attrs \\ %{}) do
    %Venue{}
    |> Venue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a venue.

  ## Examples

      iex> update_venue(venue, %{field: new_value})
      {:ok, %Venue{}}

      iex> update_venue(venue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venue(%Venue{} = venue, attrs) do
    venue
    |> Venue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a venue.

  ## Examples

      iex> delete_venue(venue)
      {:ok, %Venue{}}

      iex> delete_venue(venue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venue(%Venue{} = venue) do
    Repo.delete(venue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venue changes.

  ## Examples

      iex> change_venue(venue)
      %Ecto.Changeset{data: %Venue{}}

  """
  def change_venue(%Venue{} = venue, attrs \\ %{}) do
    Venue.changeset(venue, attrs)
  end

  alias Pta.Event.Performance

  # I want to share these values with the index module for the performances liveview

  Module.register_attribute(__MODULE__, :no_venue, persist: true)
  Module.register_attribute(__MODULE__, :no_date, persist: true)

  @no_venue -1
  @no_date nil

  @doc """
  Returns the list of performances.

  ## Examples

      iex> list_performances()
      [%Performance{}, ...]

  """
  def list_performances do
    q =
      from p in Performance,
        join: v in Venue,
        on: p.venue_id == v.id,
        select: %Performance{
          id: p.id,
          venue: v.name,
          name: p.name,
          date: p.date,
          performer: p.performer,
          start_time: p.start_time
        }

    Repo.all(q)
  end

  def list_performances(filter) when is_map(filter) do
    from(Performance)
    |> filter_by_venue(filter)
    |> filter_by_date(filter)
    |> Repo.all()
  end

  defp filter_by_venue(query, %Performance{venue_id: @no_venue}), do: query

  defp filter_by_venue(query, %Performance{venue_id: venue}) do
    where(query, venue_id: ^venue)
  end

  defp filter_by_date(query, %Performance{date: @no_date}), do: query

  defp filter_by_date(query, %Performance{date: date}) do
    where(query, date: ^date)
  end

  @doc """
  Gets a single performance.

  Raises `Ecto.NoResultsError` if the Performance does not exist.

  ## Examples

      iex> get_performance!(123)
      %Performance{}

      iex> get_performance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_performance!(id) do
    q =
      from p in Performance,
        where: p.id == ^id,
        join: v in Venue,
        on: p.venue_id == v.id,
        select: %Performance{
          id: p.id,
          venue: v.name,
          name: p.name,
          date: p.date,
          performer: p.performer,
          start_time: p.start_time
        }

    Repo.one(q)
  end

  @doc """
  Creates a performance.

  ## Examples

      iex> create_performance(%{field: value})
      {:ok, %Performance{}}

      iex> create_performance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_performance(attrs \\ %{}) do
    %Performance{}
    |> Performance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a performance.

  ## Examples

      iex> update_performance(performance, %{field: new_value})
      {:ok, %Performance{}}

      iex> update_performance(performance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_performance(%Performance{} = performance, attrs) do
    performance
    |> Performance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a performance.

  ## Examples

      iex> delete_performance(performance)
      {:ok, %Performance{}}

      iex> delete_performance(performance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_performance(%Performance{} = performance) do
    Repo.delete(performance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking performance changes.

  ## Examples

      iex> change_performance(performance)
      %Ecto.Changeset{data: %Performance{}}

  """
  def change_performance(%Performance{} = performance, attrs \\ %{}) do
    Performance.changeset(performance, attrs)
  end

  # Utilities for filtering
  def get_all_unique_cities() do
    from(v in Venue,
      select: v.city,
      distinct: true
    )
    |> Repo.all()
  end

  def get_all_unique_zipcodes() do
    from(v in Venue,
      select: v.zip,
      distinct: true
    )
    |> Repo.all()
  end
end
