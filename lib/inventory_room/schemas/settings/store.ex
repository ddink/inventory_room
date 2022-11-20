defmodule InventoryRoom.Settings.Store do
  import Ecto.Schema

  schema "stores" do
    field :name, :string
    field :url, :string
    field :meta_description, :string
    field :meta_keywords, :string
    field :seo_title, :string
    field :mail_from_address, :string
    field :default_currency, :string
    field :currency, :string
    field :default, :boolean
    field :cart_tax_country_iso, :string
    timestamps()  
  end
end