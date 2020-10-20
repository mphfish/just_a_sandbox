defmodule JustASandbox.Repo do
  use Ecto.Repo,
    otp_app: :just_a_sandbox,
    adapter: Ecto.Adapters.Postgres
end
