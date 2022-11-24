defmodule StoreRepo.Repo.Migrations.AddVariantImagesTable do
  use Ecto.Migration

  def change do
    create table("variant_images") do
      add :file, :string

      add :variant_id, references(:variants, on_delete: :nothing)

      add :alt_text, :text
      add :url, :string
      timestamps()
    end
  end
end
