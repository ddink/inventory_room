defmodule StoreRepo.Repo.Migrations.AddCreditTypesTable do
  use Ecto.Migration

  def change do
    create table("credit_types") do
      add :name, :string
      add :priority, :integer
      timestamps()
    end
  end
end


