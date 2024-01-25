defmodule PtaWeb.PerformanceLive.Index do
  use PtaWeb, :live_view

  alias Pta.Event
  alias Pta.Event.Performance
  alias Pta.DisplayFormatting

  def get_novenue do
    [no_venue] = Event.__info__(:attributes)[:no_venue]
    no_venue
  end

  def get_nodate do
    [no_date] = Event.__info__(:attributes)[:no_date]
    no_date
  end

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        filter: %{venue: get_novenue(), date: get_nodate()},
        performances: Event.list_performances()
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Performance")
    |> assign(:performance, Event.get_performance!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Performance")
    |> assign(:performance, %Performance{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Performances")
    |> assign(:performance, nil)
  end

  @impl true
  def handle_info({PtaWeb.PerformanceLive.FormComponent, {:saved, performance}}, socket) do
    {:noreply, stream_insert(socket, :performances, performance)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    performance = Event.get_performance!(id)
    {:ok, _} = Event.delete_performance(performance)

    {:noreply, stream_delete(socket, :performances, performance)}
  end
end
