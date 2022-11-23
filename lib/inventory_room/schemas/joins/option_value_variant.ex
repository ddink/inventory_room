defmodule InventoryRoom.Joins.OptionValueVariant do
  use Ecto.Schema
  alias InventoryRoom.Products.{OptionType, Variant}

  schema "option_values_variants" do
    belongs_to :variant, Variant
    belongs_to :option_type, OptionType
    timestamps()
  end
end