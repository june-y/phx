defmodule Test.Repo.Migrations.CreatePharmacies do
  use Ecto.Migration

  def change do
    create table(:pharmacies) do
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
