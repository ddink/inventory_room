defmodule InventoryRoom.Joins.ProductProperty do
  use Ecto.Schema
  alias InventoryRoom.Products.{Product, Property}

  schema "product_properties" do
    belongs_to :product, Product
    belongs_to :property, Property
    timestamps()
  end
end