defmodule StoreRepo.Repo.Migrations.AddStatesTable do
  use Ecto.Migration

  def change do
    create table("states") do
      add :name, :string
      add :abbr, :string
      add :country_id, references(:countries, on_delete: :nothing)
      timestamps()
    end
  end
end
