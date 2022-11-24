defmodule StoreRepo.Repo.Migrations.AddZoneMembersTable do
  use Ecto.Migration

  def change do
    create table("zone_members") do
      add :country_id, references(:countries)
      add :state_id, references(:states)
      add :zone_id, references(:zones)
      timestamps()
    end
  end
end
