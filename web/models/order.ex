defmodule Test.Order do
  use Test.Web, :model

  schema "orders" do
    field :order_number, :integer
    field :patient_name, :string
    field :patient_address, :string
    field :pickup_date, :date
    field :pickup_time, :time
    field :is_delivered, :boolean, default: false
    field :not_deliverable, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time, :is_delivered, :not_deliverable])
    |> validate_required([:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time, :is_delivered, :not_deliverable])
  end
end
