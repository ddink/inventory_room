defmodule StoreRepo.Repo.Migrations.AddOptionTypesTable do
  use Ecto.Migration

  def change do
    create table("option_types") do
      add :name, :string
      add :presentation, :string
      add :position, :integer, default: 0, null: false
      timestamps()
    end
  end
end
