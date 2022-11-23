defmodule InventoryRoom.Joins.ShippingMethodCategory do
  use Ecto.Schema
  alias InventoryRoom.Settings.Shipping.{ShippingCategory, ShippingMethod}

  schema "shipping_method_categories" do
    belongs_to :shipping_category, ShippingCategory
    belongs_to :shipping_method, ShippingMethod
    timestamps()
  end
end