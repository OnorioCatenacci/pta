defmodule PtaWeb.PerformanceLive.FormComponent do
  use PtaWeb, :live_component

  alias Pta.Event

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage performance records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="performance-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:performer]} type="text" label="Performer" />
        <.input field={@form[:date]} type="date" label="Date" />
        <.input field={@form[:start_time]} type="time" label="Start time" />
        <%!-- <.input field={@form[:event_hash]} type="text" label="Event hash" /> --%>
        <:actions>
          <.button phx-disable-with="Saving...">Save Performance</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{performance: performance} = assigns, socket) do
    changeset = Event.change_performance(performance)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"performance" => performance_params}, socket) do
    changeset =
      socket.assigns.performance
      |> Event.change_performance(performance_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"performance" => performance_params}, socket) do
    save_performance(socket, socket.assigns.action, performance_params)
  end

  defp save_performance(socket, :edit, performance_params) do
    case Event.update_performance(socket.assigns.performance, performance_params) do
      {:ok, performance} ->
        notify_parent({:saved, performance})

        {:noreply,
         socket
         |> put_flash(:info, "Performance updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_performance(socket, :new, performance_params) do
    case Event.create_performance(performance_params) do
      {:ok, performance} ->
        notify_parent({:saved, performance})

        {:noreply,
         socket
         |> put_flash(:info, "Performance created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
