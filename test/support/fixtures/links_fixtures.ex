defmodule CrudProject.LinksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CrudProject.Links` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        body: "some body",
        url: "some url"
      })
      |> CrudProject.Links.create_link()

    link
  end
end
