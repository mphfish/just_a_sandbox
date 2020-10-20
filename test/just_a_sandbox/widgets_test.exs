defmodule JustASandbox.WidgetsTest do
  use JustASandbox.DataCase

  alias JustASandbox.Widgets

  describe "widget" do
    alias JustASandbox.Widgets.Widget

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def widget_fixture(attrs \\ %{}) do
      {:ok, widget} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Widgets.create_widget()

      widget
    end

    test "list_widget/0 returns all widget" do
      widget = widget_fixture()
      assert Widgets.list_widget() == [widget]
    end

    test "get_widget!/1 returns the widget with given id" do
      widget = widget_fixture()
      assert Widgets.get_widget!(widget.id) == widget
    end

    test "create_widget/1 with valid data creates a widget" do
      assert {:ok, %Widget{} = widget} = Widgets.create_widget(@valid_attrs)
      assert widget.name == "some name"
    end

    test "create_widget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Widgets.create_widget(@invalid_attrs)
    end

    test "update_widget/2 with valid data updates the widget" do
      widget = widget_fixture()
      assert {:ok, %Widget{} = widget} = Widgets.update_widget(widget, @update_attrs)
      assert widget.name == "some updated name"
    end

    test "update_widget/2 with invalid data returns error changeset" do
      widget = widget_fixture()
      assert {:error, %Ecto.Changeset{}} = Widgets.update_widget(widget, @invalid_attrs)
      assert widget == Widgets.get_widget!(widget.id)
    end

    test "delete_widget/1 deletes the widget" do
      widget = widget_fixture()
      assert {:ok, %Widget{}} = Widgets.delete_widget(widget)
      assert_raise Ecto.NoResultsError, fn -> Widgets.get_widget!(widget.id) end
    end

    test "change_widget/1 returns a widget changeset" do
      widget = widget_fixture()
      assert %Ecto.Changeset{} = Widgets.change_widget(widget)
    end
  end
end
