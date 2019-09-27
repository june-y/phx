defmodule Test.Orders.Courier do
  use Ecto.Schema
  import Ecto.Changeset


  schema "couriers" do
    field :address, :string
    field :name, :string
    field :pharmacies_serviced, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :address, :pharmacies_serviced])
    |> validate_required([:name, :address, :pharmacies_serviced])

  end
end
