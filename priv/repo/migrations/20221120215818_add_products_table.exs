defmodule StoreRepo.Repo.Migrations.AddProductsTable do
  use Ecto.Migration

  def change do
    create table("products") do
      add :name, :string, default: "", null: false
      add :slug, :string
      add :description, :text
      add :meta_title, :string
      add :meta_keywords, :string
      add :meta_description, :text
      add :available_on, :naive_datetime
      add :discontinue_on, :naive_datetime
      add :promotionable, :boolean, default: true
      timestamps()
    end
  end
end
