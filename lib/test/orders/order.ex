defmodule Test.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :is_delivered, :boolean, default: false
    field :not_deliverable, :boolean, default: false
    field :order_number, :integer
    field :patient_address, :string
    field :patient_name, :string
    field :pickup_date, :date
    field :pickup_time, :time

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time, :is_delivered, :not_deliverable])
    |> validate_required([:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time, :is_delivered, :not_deliverable])
  end
end
