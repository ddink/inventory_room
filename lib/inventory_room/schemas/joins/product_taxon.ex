defmodule InventoryRoom.Joins.ProductTaxon do
  use Ecto.Schema
  alias InventoryRoom.Products.{Product, Taxon}

  schema "product_taxons" do
    belongs_to :product, Product
    belongs_to :taxon, Taxon
    timestamps()
  end
end