defmodule InventoryRoom.Products.ProductImage do
  use Ecto.Schema
  alias InventoryRoom.Products.Product

  schema "product_images" do
    field :file, Uploadex.Upload
    belongs_to :product, Product
    field :alt_text, :string
    field :url, :string
    timestamps()
  end
end