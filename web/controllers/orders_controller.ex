defmodule Test.OrdersController do
  use Test.Web, :controller

  alias Test.Orders

  def index(conn, _params) do
    courier = Repo.all(Orders)
    render(conn, "index.html", courier: courier)
  end

  def new(conn, _params) do
    changeset = Orders.changeset(%Orders{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"orders" => orders_params}) do
    changeset = Orders.changeset(%Orders{}, orders_params)

    case Repo.insert(changeset) do
      {:ok, orders} ->
        conn
        |> put_flash(:info, "Orders created successfully.")
        |> redirect(to: orders_path(conn, :show, orders))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    orders = Repo.get!(Orders, id)
    render(conn, "show.html", orders: orders)
  end

  def edit(conn, %{"id" => id}) do
    orders = Repo.get!(Orders, id)
    changeset = Orders.changeset(orders)
    render(conn, "edit.html", orders: orders, changeset: changeset)
  end

  def update(conn, %{"id" => id, "orders" => orders_params}) do
    orders = Repo.get!(Orders, id)
    changeset = Orders.changeset(orders, orders_params)

    case Repo.update(changeset) do
      {:ok, orders} ->
        conn
        |> put_flash(:info, "Orders updated successfully.")
        |> redirect(to: orders_path(conn, :show, orders))
      {:error, changeset} ->
        render(conn, "edit.html", orders: orders, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    orders = Repo.get!(Orders, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(orders)

    conn
    |> put_flash(:info, "Orders deleted successfully.")
    |> redirect(to: orders_path(conn, :index))
  end
end
