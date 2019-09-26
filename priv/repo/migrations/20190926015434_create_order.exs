defmodule Test.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :order_number, :integer
      add :patient_name, :string
      add :patient_address, :text
      add :pickup_date, :date
      add :pickup_time, :time
      add :is_delivered, :boolean, default: false, null: false
      add :not_deliverable, :boolean, default: false, null: false

      timestamps()
    end
  end
end
