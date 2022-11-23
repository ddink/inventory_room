defmodule InventoryRoom.Products.OptionValue do
  use Ecto.Schema
  alias InventoryRoom.Products.OptionType

  schema "option_values" do
    field :position, :integer
    field :name, :string
    field :presentation, :string
    belongs_to :option_type, OptionType
    timestamps()
  end
end