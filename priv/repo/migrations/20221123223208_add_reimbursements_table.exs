defmodule StoreRepo.Repo.Migrations.AddReimbursementsTable do
  use Ecto.Migration

  def change do
    create table("reimbursements") do
      add :number, :string
      add :reimbursement_status, :string
      add :total, :decimal, precision: 10, scale: 2
      add :customer_return_id, references(:customer_returns)
      add :order_id, references(:orders)
      timestamps()
    end
  end
end
