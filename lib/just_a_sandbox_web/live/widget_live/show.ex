defmodule JustASandboxWeb.WidgetLive.Show do
  use JustASandboxWeb, :live_view

  alias JustASandbox.Widgets

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:widget, Widgets.get_widget!(id))}
  end

  defp page_title(:show), do: "Show Widget"
  defp page_title(:edit), do: "Edit Widget"
end
