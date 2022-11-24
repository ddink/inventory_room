defmodule StoreRepo.Repo.Migrations.AddStorePaymentMethodsTable do
  use Ecto.Migration

  def change do
    create table("store_payment_methods") do
      add :payment_method_id, references(:payment_methods)
      add :store_id, references(:stores)
      timestamps()
    end
  end
end
