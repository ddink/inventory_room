defmodule StoreRepo.Repo.Migrations.AddZonesTable do
  use Ecto.Migration

  def change do
    create table("zones") do
      add :name, :string
      add :description, :text
      add :zone_members_count, :integer, default: 0
      add :type, :string
      timestamps()
    end
  end
end
