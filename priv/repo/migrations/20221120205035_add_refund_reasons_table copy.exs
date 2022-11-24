defmodule StoreRepo.Repo.Migrations.AddRefundReasonsTable do
  use Ecto.Migration

  def change do
    create table("refund_reasons") do
      add :name, :string
      add :active, :boolean, default: true
      add :mutable, :boolean, default: true
      add :code, :string
      timestamps()
    end
  end
end
