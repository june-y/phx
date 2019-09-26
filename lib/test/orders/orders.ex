defmodule Test.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias Test.Repo

  alias Test.Orders.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{source: %Order{}}

  """
  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end

  alias Test.Orders.Pharmacy

  @doc """
  Returns the list of pharmacies.

  ## Examples

      iex> list_pharmacies()
      [%Pharmacy{}, ...]

  """
  def list_pharmacies do
    Repo.all(Pharmacy)
  end

  @doc """
  Gets a single pharmacy.

  Raises `Ecto.NoResultsError` if the Pharmacy does not exist.

  ## Examples

      iex> get_pharmacy!(123)
      %Pharmacy{}

      iex> get_pharmacy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy!(id), do: Repo.get!(Pharmacy, id)

  @doc """
  Creates a pharmacy.

  ## Examples

      iex> create_pharmacy(%{field: value})
      {:ok, %Pharmacy{}}

      iex> create_pharmacy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy(attrs \\ %{}) do
    %Pharmacy{}
    |> Pharmacy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy.

  ## Examples

      iex> update_pharmacy(pharmacy, %{field: new_value})
      {:ok, %Pharmacy{}}

      iex> update_pharmacy(pharmacy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy(%Pharmacy{} = pharmacy, attrs) do
    pharmacy
    |> Pharmacy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pharmacy.

  ## Examples

      iex> delete_pharmacy(pharmacy)
      {:ok, %Pharmacy{}}

      iex> delete_pharmacy(pharmacy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy(%Pharmacy{} = pharmacy) do
    Repo.delete(pharmacy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy changes.

  ## Examples

      iex> change_pharmacy(pharmacy)
      %Ecto.Changeset{source: %Pharmacy{}}

  """
  def change_pharmacy(%Pharmacy{} = pharmacy) do
    Pharmacy.changeset(pharmacy, %{})
  end

  alias Test.Orders.Courier

  @doc """
  Returns the list of couriers.

  ## Examples

      iex> list_couriers()
      [%Courier{}, ...]

  """
  def list_couriers do
    Repo.all(Courier)
  end

  @doc """
  Gets a single courier.

  Raises `Ecto.NoResultsError` if the Courier does not exist.

  ## Examples

      iex> get_courier!(123)
      %Courier{}

      iex> get_courier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_courier!(id), do: Repo.get!(Courier, id)

  @doc """
  Creates a courier.

  ## Examples

      iex> create_courier(%{field: value})
      {:ok, %Courier{}}

      iex> create_courier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_courier(attrs \\ %{}) do
    %Courier{}
    |> Courier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a courier.

  ## Examples

      iex> update_courier(courier, %{field: new_value})
      {:ok, %Courier{}}

      iex> update_courier(courier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_courier(%Courier{} = courier, attrs) do
    courier
    |> Courier.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Courier.

  ## Examples

      iex> delete_courier(courier)
      {:ok, %Courier{}}

      iex> delete_courier(courier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_courier(%Courier{} = courier) do
    Repo.delete(courier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking courier changes.

  ## Examples

      iex> change_courier(courier)
      %Ecto.Changeset{source: %Courier{}}

  """
  def change_courier(%Courier{} = courier) do
    Courier.changeset(courier, %{})
  end
end
