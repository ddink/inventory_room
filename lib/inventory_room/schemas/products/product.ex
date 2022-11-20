defmodule InventoryRoom.Products.Product do
	# import Ecto.Schema
	
	# schema "products" do
		# field(:name, :string) -- should default to "", required (cannot be nil)
		# field(:slug, :string)
		# field(:description, :string)
		# has_many(:taxonomies, Taxonomies)
		# has_many(:option_types, OptionType)
		# field(:meta_title, :string)
		# field(:meta_keywords, :string)
		# field(:meta_description, :string)
		# field(:master_price, :float)
		# field(:cost_price, :float)
		# field(:available_on, :naive_datetime)
		# field(:discontinue_on, :naive_datetime)
		# field(:promotionable, :boolean) -- should default to true
		# field(:master_sku, :string)
		# has_many(:variants, Variant)
		# field(:height, :float)
		# field(:weight, :float)
		# field(:depth, :float)
		# field(:width, :float)
		# has_one(:shipping_category, ShippingCategory)
		# has_one(:tax_category, TaxCategory)
		# has_many(:product_images, ProductImage)
		# embeds_many(:prices, Price)
		# embeds_many(:properties, Property) -- not the same thing as a PropertyType
		# embeds_many(:stocks, Stock)
		# timestamps()
	# end
end