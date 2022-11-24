defmodule StoreRepo.Repo.Migrations.AddRefundsTable do
  use Ecto.Migration

  def change do
    create table("refunds") do
      add :amount, :decimal, precision: 10, scale: 2, default: "0.0", null: false
      add :payment_id, references(:payments)
      add :refund_reason_id, references(:refund_reasons)
      add :reimbursement_id, references(:reimbursements)
    end
  end
end
