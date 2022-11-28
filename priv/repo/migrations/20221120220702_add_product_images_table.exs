defmodule StoreRepo.Repo.Migrations.AddProductImagesTable do
  use Ecto.Migration

  def change do
    create table("product_images") do
      add :file, :string, null: false
      
      add :product_id, references(:products, on_delete: :nothing), null: false
      
      add :alt_text, :text
      add :url, :string, null: false
      timestamps()
    end
  end
end
