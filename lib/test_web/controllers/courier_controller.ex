defmodule TestWeb.CourierController do
  use TestWeb, :controller

  alias Test.Orders
  alias Test.Orders.Courier

  def index(conn, _params) do
    couriers = Orders.list_couriers()
    render(conn, "index.html", couriers: couriers)
  end

  def new(conn, _params) do
    changeset = Orders.change_courier(%Courier{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"courier" => courier_params}) do
    case Orders.create_courier(courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier created successfully.")
        |> redirect(to: courier_path(conn, :show, courier))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    courier = Orders.get_courier!(id)
    render(conn, "show.html", courier: courier)
  end

  def edit(conn, %{"id" => id}) do
    courier = Orders.get_courier!(id)
    changeset = Orders.change_courier(courier)
    render(conn, "edit.html", courier: courier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "courier" => courier_params}) do
    courier = Orders.get_courier!(id)

    case Orders.update_courier(courier, courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier updated successfully.")
        |> redirect(to: courier_path(conn, :show, courier))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", courier: courier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    courier = Orders.get_courier!(id)
    {:ok, _courier} = Orders.delete_courier(courier)

    conn
    |> put_flash(:info, "Courier deleted successfully.")
    |> redirect(to: courier_path(conn, :index))
  end
end
