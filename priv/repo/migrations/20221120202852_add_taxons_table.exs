defmodule StoreRepo.Repo.Migrations.AddTaxonsTable do
  use Ecto.Migration

  def change do
    create table("taxons") do
      add :parent_id, :integer
      add :position, :integer, default: 0
      add :name, :string, null: false
      add :permalink, :string
      
      add :taxonomy_id, references(:taxonomies, on_delete: :nothing)

      add :icon_file_name, :string
      add :icon_content_type, :string
      add :icon_file_size, :integer
      add :icon_updated_at, :naive_datetime
      add :description, :text
      add :meta_title, :string
      add :meta_description, :text
      add :meta_keywords, :string
      timestamps()
    end
  end
end
