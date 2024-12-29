defmodule CrudProjectWeb.LinkLive.Index do
  use CrudProjectWeb, :live_view
  alias CrudProject.Links

  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id
    socket = socket
    |> assign(:links, Links.list_links(user_id))

    {:ok, socket}
  end

end
