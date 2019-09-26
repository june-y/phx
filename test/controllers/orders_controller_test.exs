defmodule Test.OrdersControllerTest do
  use Test.ConnCase

  alias Test.Orders
  @valid_attrs %{address: "some address", couriers: "some couriers", name: "some name", pharmacies_serviced: []}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, orders_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing courier"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, orders_path(conn, :new)
    assert html_response(conn, 200) =~ "New orders"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, orders_path(conn, :create), orders: @valid_attrs
    orders = Repo.get_by!(Orders, @valid_attrs)
    assert redirected_to(conn) == orders_path(conn, :show, orders.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, orders_path(conn, :create), orders: @invalid_attrs
    assert html_response(conn, 200) =~ "New orders"
  end

  test "shows chosen resource", %{conn: conn} do
    orders = Repo.insert! %Orders{}
    conn = get conn, orders_path(conn, :show, orders)
    assert html_response(conn, 200) =~ "Show orders"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, orders_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    orders = Repo.insert! %Orders{}
    conn = get conn, orders_path(conn, :edit, orders)
    assert html_response(conn, 200) =~ "Edit orders"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    orders = Repo.insert! %Orders{}
    conn = put conn, orders_path(conn, :update, orders), orders: @valid_attrs
    assert redirected_to(conn) == orders_path(conn, :show, orders)
    assert Repo.get_by(Orders, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    orders = Repo.insert! %Orders{}
    conn = put conn, orders_path(conn, :update, orders), orders: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit orders"
  end

  test "deletes chosen resource", %{conn: conn} do
    orders = Repo.insert! %Orders{}
    conn = delete conn, orders_path(conn, :delete, orders)
    assert redirected_to(conn) == orders_path(conn, :index)
    refute Repo.get(Orders, orders.id)
  end
end
