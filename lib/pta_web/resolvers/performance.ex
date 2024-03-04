defmodule Pta.Web.Resolvers.Performance do
  alias Pta.Event
  alias Pta.Event.Performance
  alias Pta.Event.Venue

  defp get_no_venue do
    [no_venue] = Pta.Event.__info__(:attributes)[:no_venue]
    no_venue
  end

  defp get_no_city do
    [no_city] = Pta.Event.__info__(:attributes)[:no_city]
    no_city
  end

  defp get_no_zip do
    [no_zip] = Pta.Event.__info__(:attributes)[:no_zip]
    no_zip
  end


  defp get_venue_id_from_name(venue_name) do
    venue = Event.list_venues(%Venue{city: get_no_city(), zip: get_no_zip(), name: venue_name})
    [%Venue{id: id}] = venue
    id
  end



  def performances(_, %{performance_date: pdate} = _args, _) do
    {:ok, Event.list_performances(%Performance{date: pdate, venue_id: get_no_venue()})}
  end

  def performances(_, %{venue: venue_name} = _args, _) do
    {:ok, Event.list_performances(%Performance{venue_id: get_venue_id_from_name(venue_name) })}
  end

  def performances(_, %{}, _), do: {:ok, Event.list_performances()}
end
