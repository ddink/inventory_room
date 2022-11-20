defmodule StoreRepo.Repo.Migrations.AddShippingMethodsTable do
  use Ecto.Migration

  def change do
    create table("shipping_methods") do
      add :name, :string
      add :display_on, :string
      add :deleted_at, :naive_datetime
      add :tracking_url, :string
      add :internal_name, :string
      add :code, :string
      add :available_to_all, :boolean, defualt: true
      add :carrier, :string
      add :service_level, :string
      timestamps()
    end
  end
end
