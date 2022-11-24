defmodule StoreRepo.Repo.Migrations.AddPaymentsTable do
  use Ecto.Migration

  def change do
    create table("payments") do
      add :amount, :decimal, precision: 10, scale: 2, default: "0.0", null: false
      add :state, :string
      add :response_code, :string
      add :avs_response, :string
      add :number, :string
      add :cvv_response_code, :string
      add :cvv_response_message, :string
      add :order_id, references(:orders)
      add :payment_method_id, references(:payment_methods)
      timestamps()
    end
  end
end
