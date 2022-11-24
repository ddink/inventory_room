defmodule StoreRepo.Repo.Migrations.AddStoresTable do
  use Ecto.Migration

  def change do
    create table("stores") do
      add :name, :string
      add :url, :string
      add :meta_description, :text
      add :meta_keywords, :text
      add :seo_title, :string
      add :mail_from_address, :string
      add :default_currency, :string
      add :currency, :string
      add :default, :boolean, default: false, null: false
      add :cart_tax_country_iso, :string
      timestamps()
    end
  end
end
