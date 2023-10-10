defmodule Pta.Repo do
  use Ecto.Repo,
    otp_app: :pta,
    adapter: Ecto.Adapters.Postgres
end
