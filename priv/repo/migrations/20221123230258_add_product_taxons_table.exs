defmodule StoreRepo.Repo.Migrations.AddProductTaxonsTable do
  use Ecto.Migration

  def change do
    create table("product_taxons") do
      add :product_id, references(:products)
      add :taxon_id, references(:taxons)
      timestamps()
    end
  end
end
