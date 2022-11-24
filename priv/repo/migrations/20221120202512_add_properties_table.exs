defmodule StoreRepo.Repo.Migrations.AddPropertiesTable do
  use Ecto.Migration

  def change do
    create table("properties") do
      add :name, :string
      add :presentation, :string, null: false
      timestamps()
    end
  end
end
