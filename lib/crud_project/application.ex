defmodule CrudProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CrudProjectWeb.Telemetry,
      CrudProject.Repo,
      {DNSCluster, query: Application.get_env(:crud_project, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CrudProject.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CrudProject.Finch},
      # Start a worker by calling: CrudProject.Worker.start_link(arg)
      # {CrudProject.Worker, arg},
      # Start to serve requests, typically the last entry
      CrudProjectWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrudProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrudProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
