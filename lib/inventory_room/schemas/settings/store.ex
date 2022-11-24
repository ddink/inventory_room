defmodule InventoryRoom.Settings.Store do
  use Ecto.Schema
  alias InventoryRoom.Joins.StorePaymentMethod

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
    has_many :store_payment_methods, StorePaymentMethod
    has_many :payment_methods, through: [:store_payment_methods, :payment_method]
    timestamps()  
  end
end