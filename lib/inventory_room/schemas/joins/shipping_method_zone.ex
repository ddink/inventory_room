defmodule InventoryRoom.Joins.ShippingMethodZone do
  use Ecto.Schema
  alias InventoryRoom.Settings.Shipping.ShippingMethod
  alias InventoryRoom.Settings.Zones.Zone

  schema "shipping_method_zones" do
    belongs_to :shipping_method, ShippingMethod
    belongs_to :zone, Zone
    timestamps()
  end
end