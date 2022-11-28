defmodule StoreRepo.Repo.Migrations.AddPaymentMethodsTable do
  use Ecto.Migration

  def change do
    create table("payment_methods") do
      add :type, :string
      add :name, :string
      add :description, :text
      add :active, :boolean
      add :available_to_users, :boolean
      add :available_to_admin, :boolean
      add :auto_capture, :boolean
      timestamps()
    end
  end
end
