defmodule CrudProject.Repo do
  use Ecto.Repo,
    otp_app: :crud_project,
    adapter: Ecto.Adapters.Postgres
end
