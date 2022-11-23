defmodule InventoryRoom.Products.Taxonomy do
	use Ecto.Schema
	
	schema "taxonomies" do
		field(:name, :string)
		field(:position, :integer)
		timestamps()
	end
end