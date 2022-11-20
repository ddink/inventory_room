defmodule StoreRepo.Repo.Migrations.AddCountriesTable do
  use Ecto.Migration

  def change do
    create table("countries") do
      add :iso_name, :string
      add :iso, :string
      add :iso3, :string
      add :name, :string
      add :numcode, :integer
      add :states_required, :boolean, default: false
      timestamps()
    end
  end
end
