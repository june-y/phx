defmodule Test.OrdersTest do
  use Test.DataCase

  alias Test.Orders

  describe "orders" do
    alias Test.Orders.Order

    @valid_attrs %{is_delivered: true, not_deliverable: true, order_number: 42, patient_address: "some patient_address", patient_name: "some patient_name", pickup_date: ~D[2010-04-17], pickup_time: ~T[14:00:00.000000]}
    @update_attrs %{is_delivered: false, not_deliverable: false, order_number: 43, patient_address: "some updated patient_address", patient_name: "some updated patient_name", pickup_date: ~D[2011-05-18], pickup_time: ~T[15:01:01.000000]}
    @invalid_attrs %{is_delivered: nil, not_deliverable: nil, order_number: nil, patient_address: nil, patient_name: nil, pickup_date: nil, pickup_time: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.is_delivered == true
      assert order.not_deliverable == true
      assert order.order_number == 42
      assert order.patient_address == "some patient_address"
      assert order.patient_name == "some patient_name"
      assert order.pickup_date == ~D[2010-04-17]
      assert order.pickup_time == ~T[14:00:00.000000]
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Orders.update_order(order, @update_attrs)
      assert %Order{} = order
      assert order.is_delivered == false
      assert order.not_deliverable == false
      assert order.order_number == 43
      assert order.patient_address == "some updated patient_address"
      assert order.patient_name == "some updated patient_name"
      assert order.pickup_date == ~D[2011-05-18]
      assert order.pickup_time == ~T[15:01:01.000000]
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end

  describe "pharmacies" do
    alias Test.Orders.Pharmacy

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Orders.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Orders.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Orders.create_pharmacy(@valid_attrs)
      assert pharmacy.address == "some address"
      assert pharmacy.name == "some name"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, pharmacy} = Orders.update_pharmacy(pharmacy, @update_attrs)
      assert %Pharmacy{} = pharmacy
      assert pharmacy.address == "some updated address"
      assert pharmacy.name == "some updated name"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Orders.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Orders.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Orders.change_pharmacy(pharmacy)
    end
  end

  describe "couriers" do
    alias Test.Orders.Courier

    @valid_attrs %{address: "some address", name: "some name", pharmacies_serviced: []}
    @update_attrs %{address: "some updated address", name: "some updated name", pharmacies_serviced: []}
    @invalid_attrs %{address: nil, name: nil, pharmacies_serviced: nil}

    def courier_fixture(attrs \\ %{}) do
      {:ok, courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_courier()

      courier
    end

    test "list_couriers/0 returns all couriers" do
      courier = courier_fixture()
      assert Orders.list_couriers() == [courier]
    end

    test "get_courier!/1 returns the courier with given id" do
      courier = courier_fixture()
      assert Orders.get_courier!(courier.id) == courier
    end

    test "create_courier/1 with valid data creates a courier" do
      assert {:ok, %Courier{} = courier} = Orders.create_courier(@valid_attrs)
      assert courier.address == "some address"
      assert courier.name == "some name"
      assert courier.pharmacies_serviced == []
    end

    test "create_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_courier(@invalid_attrs)
    end

    test "update_courier/2 with valid data updates the courier" do
      courier = courier_fixture()
      assert {:ok, courier} = Orders.update_courier(courier, @update_attrs)
      assert %Courier{} = courier
      assert courier.address == "some updated address"
      assert courier.name == "some updated name"
      assert courier.pharmacies_serviced == []
    end

    test "update_courier/2 with invalid data returns error changeset" do
      courier = courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_courier(courier, @invalid_attrs)
      assert courier == Orders.get_courier!(courier.id)
    end

    test "delete_courier/1 deletes the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{}} = Orders.delete_courier(courier)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_courier!(courier.id) end
    end

    test "change_courier/1 returns a courier changeset" do
      courier = courier_fixture()
      assert %Ecto.Changeset{} = Orders.change_courier(courier)
    end
  end
end
