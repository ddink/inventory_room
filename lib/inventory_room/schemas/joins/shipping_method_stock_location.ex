defmodule InventoryRoom.Joins.ShippingMethodStockLocation do
  use Ecto.Schema
  alias InventoryRoom.Settings.Shipping.{ShippingMethod, StockLocation}

  schema "shipping_method_stock_locations" do
    belongs_to :shipping_method, ShippingMethod
    belongs_to :stock_location, StockLocation
    timestamps()
  end
end