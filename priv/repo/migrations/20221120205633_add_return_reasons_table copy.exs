defmodule StoreRepo.Repo.Migrations.AddReturnReasonsTable do
  use Ecto.Migration

  def change do
    create table("return_reasons") do
      add :name, :string
      add :active, :boolean, default: true
      add :mutable, :boolean, default: true
      timestamps()
    end
  end
end
