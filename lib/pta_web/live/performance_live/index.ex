defmodule PtaWeb.PerformanceLive.Index do
  use PtaWeb, :live_view

  alias Pta.Event
  alias Pta.Event.Performance

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :performances, Event.list_performances())}
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
