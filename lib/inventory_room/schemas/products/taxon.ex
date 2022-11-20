defmodule InventoryRoom.Products.Taxon do
	import Ecto.Schema
	
	schema "taxons" do
		field(:parent_id, :integer)
		field(:position, :integer)
		field(:name, :string)
		field(:permalink, :string)
		belongs_to(:taxonomy, Taxonomy)
		field(:icon_file_name, :string)
		field(:icon_content_type, :string)
		field(:icon_file_size, :integer)
		field(:icon_updated_at, :naive_datetime)
		field(:description, :string)
		field(:meta_title, :string)
		field(:meta_description, :string)
		field(:meta_keywords, :string)
		timestamps()
	end
end