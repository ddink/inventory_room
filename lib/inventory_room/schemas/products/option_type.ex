defmodule InventoryRoom.Products.OptionType do
  import Ecto.Schema
	
	schema "order_types" do
		field :name, :string
		field :presentation, :string
		field :position, :integer
		timestamps()
	end  
end