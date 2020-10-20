defmodule JustASandboxWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `JustASandboxWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, JustASandboxWeb.WidgetLive.FormComponent,
        id: @widget.id || :new,
        action: @live_action,
        widget: @widget,
        return_to: Routes.widget_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, JustASandboxWeb.ModalComponent, modal_opts)
  end
end
