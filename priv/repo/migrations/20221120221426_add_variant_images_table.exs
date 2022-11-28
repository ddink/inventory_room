defmodule StoreRepo.Repo.Migrations.AddVariantImagesTable do
  use Ecto.Migration

  def change do
    create table("variant_images") do
      add :file, :string, null: false

      add :variant_id, references(:variants, on_delete: :nothing), null: false

      add :alt_text, :text
      add :url, :string, null: false
      timestamps()
    end
  end
end
