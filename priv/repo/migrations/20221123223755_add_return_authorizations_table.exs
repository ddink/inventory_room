defmodule StoreRepo.Repo.Migrations.AddReturnAuthorizationsTable do
  use Ecto.Migration

  def change do
    create table("return_authorizations") do
      add :number, :string
      add :state, :string
      add :memo, :text
      add :order_id, references(:orders)
      add :stock_location_id, references(:stock_locations)
      timestamps()
    end
  end
end
