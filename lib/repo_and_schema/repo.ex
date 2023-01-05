defmodule First.Repo do
  use Ecto.Repo,
    otp_app: :assignment_first,
    adapter: Ecto.Adapters.Postgres
end
