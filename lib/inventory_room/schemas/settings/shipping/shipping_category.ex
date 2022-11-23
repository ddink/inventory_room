defmodule InventoryRoom.Settings.Shipping.ShippingCategory do
  use Ecto.Schema

  schema "shipping_categories" do
    field :name, :string
    timestamps()
  end
end