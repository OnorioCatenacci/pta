defmodule PtaWeb.VenueLive.Index do
  use PtaWeb, :live_view

  alias PtaWeb.PtaComponents, as: Pc
  alias Pta.Event
  alias Pta.Event.Venue

  def get_nocity do
    [no_city] = Event.__info__(:attributes)[:no_city]
    no_city
  end

  def get_nozip do
    [no_zip] = Event.__info__(:attributes)[:no_zip]
    no_zip
  end

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        filter: %{city: get_nocity(), zip: get_nozip()},
        unique_cities: Event.get_all_unique_cities(),
        unique_zipcodes: Event.get_all_unique_zipcodes(),
        venues: Event.list_venues()
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Venue")
    |> assign(:venue, Event.get_venue!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Venue")
    |> assign(:venue, %Venue{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Venues")
    |> assign(:venue, nil)
  end

  @impl true
  def handle_info({PtaWeb.VenueLive.FormComponent, {:saved, venue}}, socket) do
    {:noreply, stream_insert(socket, :venues, venue)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    venue = Event.get_venue!(id)
    {:ok, _} = Event.delete_venue(venue)

    {:noreply, stream_delete(socket, :venues, venue)}
  end

  def handle_event("filter", %{"city" => city, "zipcode" => zip}, socket) do
    filter = %{city: city, zip: zip}
    venues = Event.list_venues(filter)

    socket =
      assign(socket,
        filter: filter,
        unique_cities: Event.get_all_unique_cities(),
        unique_zipcodes: Event.get_all_unique_zipcodes(),
        venues: venues
      )

    {:noreply, socket}
  end
end
