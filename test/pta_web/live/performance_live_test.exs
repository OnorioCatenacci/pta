defmodule PtaWeb.PerformanceLiveTest do
  use PtaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Pta.EventFixtures

  @create_attrs %{
    name: "some name",
    date: "2023-11-08",
    performer: "some performer",
    start_time: "14:00",
    venue_id: 1
  }
  @update_attrs %{
    name: "some updated name",
    date: "2023-11-09",
    performer: "some updated performer",
    start_time: "15:01",
    venue_id: 1
  }
  @invalid_attrs %{
    name: nil,
    date: nil,
    performer: nil,
    start_time: nil,
    venue_id: 0
  }

  defp create_performance(_) do
    performance = performance_fixture()
    %{performance: performance}
  end

  describe "Index" do
    setup [:create_performance]

    test "lists all performances", %{conn: conn, performance: performance} do
      {:ok, _index_live, html} = live(conn, ~p"/performances")

      assert html =~ "Listing Performances"
      assert html =~ performance.name
    end

    test "saves new performance", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/performances")

      assert index_live |> element("a", "New Performance") |> render_click() =~
               "New Performance"

      assert_patch(index_live, ~p"/performances/new")

      assert index_live
             |> form("#performance-form", performance: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#performance-form", performance: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/performances")

      html = render(index_live)
      assert html =~ "Performance created successfully"
      assert html =~ "some name"
    end

    test "updates performance in listing", %{conn: conn, performance: performance} do
      {:ok, index_live, _html} = live(conn, ~p"/performances")

      assert index_live |> element("#performances-#{performance.id} a", "Edit") |> render_click() =~
               "Edit Performance"

      assert_patch(index_live, ~p"/performances/#{performance}/edit")

      assert index_live
             |> form("#performance-form", performance: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#performance-form", performance: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/performances")

      html = render(index_live)
      assert html =~ "Performance updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes performance in listing", %{conn: conn, performance: performance} do
      {:ok, index_live, _html} = live(conn, ~p"/performances")

      assert index_live
             |> element("#performances-#{performance.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#performances-#{performance.id}")
    end
  end

  describe "Show" do
    setup [:create_performance]

    test "displays performance", %{conn: conn, performance: performance} do
      {:ok, _show_live, html} = live(conn, ~p"/performances/#{performance}")

      assert html =~ "Show Performance"
      assert html =~ performance.name
    end

    test "updates performance within modal", %{conn: conn, performance: performance} do
      {:ok, show_live, _html} = live(conn, ~p"/performances/#{performance}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Performance"

      assert_patch(show_live, ~p"/performances/#{performance}/show/edit")

      assert show_live
             |> form("#performance-form", performance: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#performance-form", performance: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/performances/#{performance}")

      html = render(show_live)
      assert html =~ "Performance updated successfully"
      assert html =~ "some updated name"
    end
  end
end
