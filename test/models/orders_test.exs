defmodule Test.OrdersTest do
  use Test.ModelCase

  alias Test.Orders

  @valid_attrs %{address: "some address", couriers: "some couriers", name: "some name", pharmacies_serviced: []}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Orders.changeset(%Orders{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Orders.changeset(%Orders{}, @invalid_attrs)
    refute changeset.valid?
  end
end
