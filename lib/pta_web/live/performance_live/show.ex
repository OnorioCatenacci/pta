defmodule PtaWeb.PerformanceLive.Show do
  use PtaWeb, :live_view

  alias Pta.Event

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:performance, Event.get_performance!(id))}
  end

  defp page_title(:show), do: "Show Performance"
  defp page_title(:edit), do: "Edit Performance"
end
