defmodule InventoryRoom.Joins.ProductOptionType do
  use Ecto.Schema
  alias InventoryRoom.Products.{OptionType, Product}

  schema "product_option_types" do
    belongs_to :product, Product
    belongs_to :option_type, OptionType
    timestamps()
  end
end