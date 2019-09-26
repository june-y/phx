defmodule Test.Orders do
  use Test.Web, :model

  schema "courier" do
    field :couriers, :string
    field :name, :string
    field :address, :string
    field :pharmacies_serviced, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:couriers, :name, :address, :pharmacies_serviced])
    |> validate_required([:couriers, :name, :address, :pharmacies_serviced])
  end
end
