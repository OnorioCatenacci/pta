defmodule Pta.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PtaWeb.Telemetry,
      # Start the Ecto repository
      Pta.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pta.PubSub},
      # Start Finch
      {Finch, name: Pta.Finch},
      # Start the Endpoint (http/https)
      PtaWeb.Endpoint
      # Start a worker by calling: Pta.Worker.start_link(arg)
      # {Pta.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pta.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PtaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
