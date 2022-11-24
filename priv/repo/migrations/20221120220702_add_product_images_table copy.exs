defmodule StoreRepo.Repo.Migrations.AddProductImagesTable do
  use Ecto.Migration

  def change do
    create table("product_images") do
      add :file, :string
      
      add :product_id, references(:products, on_delete: :nothing)
      
      add :alt_text, :text
      add :url, :string
      timestamps()
    end
  end
end
