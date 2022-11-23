defmodule InventoryRoom.Products.OptionType do
  use Ecto.Schema
	
	schema "option_types" do
		field :name, :string
		field :presentation, :string
		field :position, :integer
		timestamps()
	end  
end