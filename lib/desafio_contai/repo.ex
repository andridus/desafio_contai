defmodule DesafioContai.Repo do
  use Ecto.Repo,
    otp_app: :desafio_contai,
    adapter: Ecto.Adapters.Postgres
end
