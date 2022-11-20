defmodule StoreRepo.Repo.Migrations.AddCreditReasonsTable do
  use Ecto.Migration

  def change do
    create table("credit_reasons") do
      add :name, :string
      timestamps()
    end
  end
end
