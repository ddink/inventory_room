defmodule InventoryRoom.Joins.VariantOptionValue do
  use Ecto.Schema
  alias InventoryRoom.Products.{OptionValue, Variant}

  schema "variant_option_values" do
    belongs_to :variant, Variant
    belongs_to :option_value, OptionValue
    timestamps()
  end
end