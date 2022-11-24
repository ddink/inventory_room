defmodule StoreRepo.Repo.Migrations.AddTaxonomiesTable do
  use Ecto.Migration

  def change do
    create table("taxonomies") do
      add :name, :string, null: false
      add :position, :integer, default: 0
      timestamps()
    end
  end
end
