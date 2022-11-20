defmodule StoreRepo.Repo.Migrations.AddReimbursementsTypesTable do
  use Ecto.Migration

  def change do
    create table("reimbursement_types") do
      add :name, :string
      add :active, :boolean, default: true
      add :mutable, :boolean, default: true
      add :type, :string
      timestamps()
    end
  end
end
