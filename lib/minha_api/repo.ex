defmodule MinhaApi.Repo do
  use Ecto.Repo,
    otp_app: :minha_api,
    adapter: Ecto.Adapters.Postgres
end
