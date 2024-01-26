defmodule PtaWeb.Router do
  use PtaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PtaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PtaWeb do
    pipe_through :browser

    get "/", PageController, :home

    # Venues
    live "/venues", VenueLive.Index, :index
    live "/venues/new", VenueLive.Index, :new
    live "/venues/:id/edit", VenueLive.Index, :edit

    live "/venues/:id", VenueLive.Show, :show
    live "/venues/:id/show/edit", VenueLive.Show, :edit
    # Performances
    live "/performances", PerformanceLive.Index, :index
    live "/performances/new", PerformanceLive.Index, :new
    live "/performances/:id/edit", PerformanceLive.Index, :edit

    live "/performances/:id", PerformanceLive.Show, :show
    live "/performances/:id/show/edit", PerformanceLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: Pta.Web.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Pta.Web.Schema,
      interface: :simple
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pta, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PtaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
