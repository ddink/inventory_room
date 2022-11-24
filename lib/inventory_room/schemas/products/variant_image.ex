defmodule InventoryRoom.Products.VariantImage do
  use Ecto.Schema
  alias InventoryRoom.Products.Variant

  schema "variant_images" do
    # field :file, Uploadex.Upload
    belongs_to :variant, Variant
    field :alt_text, :string
    field :url, :string
    timestamps()
  end
end