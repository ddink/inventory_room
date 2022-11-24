defmodule StoreRepo.Repo.Migrations.AddCustomerReturnsTable do
  use Ecto.Migration

  def change do
    create table("customer_returns") do
      add :number, :string
      add :stock_location_id, references(:stock_locations)
      timestamps()
    end
  end
end
