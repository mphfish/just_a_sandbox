defmodule JustASandboxWeb.WidgetLive.Index do
  use JustASandboxWeb, :live_view

  alias JustASandbox.Widgets
  alias JustASandbox.Widgets.Widget

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :widget_collection, list_widget())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Widget")
    |> assign(:widget, Widgets.get_widget!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Widget")
    |> assign(:widget, %Widget{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Widget")
    |> assign(:widget, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    widget = Widgets.get_widget!(id)
    {:ok, _} = Widgets.delete_widget(widget)

    {:noreply, assign(socket, :widget_collection, list_widget())}
  end

  defp list_widget do
    Widgets.list_widget()
  end
end
