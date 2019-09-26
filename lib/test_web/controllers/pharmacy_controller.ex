defmodule TestWeb.PharmacyController do
  use TestWeb, :controller

  alias Test.Orders
  alias Test.Orders.Pharmacy

  def index(conn, _params) do
    pharmacies = Orders.list_pharmacies()
    render(conn, "index.html", pharmacies: pharmacies)
  end

  def new(conn, _params) do
    changeset = Orders.change_pharmacy(%Pharmacy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pharmacy" => pharmacy_params}) do
    case Orders.create_pharmacy(pharmacy_params) do
      {:ok, pharmacy} ->
        conn
        |> put_flash(:info, "Pharmacy created successfully.")
        |> redirect(to: pharmacy_path(conn, :show, pharmacy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pharmacy = Orders.get_pharmacy!(id)
    render(conn, "show.html", pharmacy: pharmacy)
  end

  def edit(conn, %{"id" => id}) do
    pharmacy = Orders.get_pharmacy!(id)
    changeset = Orders.change_pharmacy(pharmacy)
    render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pharmacy" => pharmacy_params}) do
    pharmacy = Orders.get_pharmacy!(id)

    case Orders.update_pharmacy(pharmacy, pharmacy_params) do
      {:ok, pharmacy} ->
        conn
        |> put_flash(:info, "Pharmacy updated successfully.")
        |> redirect(to: pharmacy_path(conn, :show, pharmacy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharmacy = Orders.get_pharmacy!(id)
    {:ok, _pharmacy} = Orders.delete_pharmacy(pharmacy)

    conn
    |> put_flash(:info, "Pharmacy deleted successfully.")
    |> redirect(to: pharmacy_path(conn, :index))
  end
end
