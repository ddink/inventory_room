defmodule InventoryRoom.Products.Property do
	use Ecto.Schema
	
	schema "properties" do
		field(:name, :string)
		field(:presentation, :string)
		timestamps()
	end
end