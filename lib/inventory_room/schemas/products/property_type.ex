defmodule InventoryRoom.Products.PropertyType do
	import Ecto.Schema
	
	schema "property_types" do
		field(:name, :string)
		field(:presentation, :string)
		timestamps()
	end
end