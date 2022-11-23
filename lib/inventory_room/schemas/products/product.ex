# create_table "spree_products", force: :cascade do |t|
# 	t.string "name", default: "", null: false
# 	t.text "description"
# 	t.datetime "available_on"
# 	t.datetime "deleted_at"
# 	t.string "slug"
# 	t.text "meta_description"
# 	t.string "meta_keywords"
# 	t.integer "tax_category_id"
# 	t.integer "shipping_category_id"
# 	t.datetime "created_at", precision: 6
# 	t.datetime "updated_at", precision: 6
# 	t.boolean "promotionable", default: true
# 	t.string "meta_title"
# 	t.index ["available_on"], name: "index_spree_products_on_available_on"
# 	t.index ["deleted_at"], name: "index_spree_products_on_deleted_at"
# 	t.index ["name"], name: "index_spree_products_on_name"
# 	t.index ["slug"], name: "index_spree_products_on_slug", unique: true
# end

defmodule InventoryRoom.Products.Product do
	use Ecto.Schema
	alias InventoryRoom.Products.{
		OptionType, 
		Taxonomy,
		Variant,
		ProductImage
	}
	alias InventoryRoom.Settings.Shipping.ShippingCategory
	
	schema "products" do
		field(:name, :string)
		field(:slug, :string)
		field(:description, :string)
		has_many(:taxonomies, Taxonomy)
		has_many(:option_types, OptionType)
		field(:meta_title, :string)
		field(:meta_keywords, :string)
		field(:meta_description, :string)
		field(:available_on, :naive_datetime)
		field(:discontinue_on, :naive_datetime)
		field(:promotionable, :boolean)
		field(:master_sku, :string)
		has_many(:variants, Variant)
		has_one(:shipping_category, ShippingCategory)
		has_one(:tax_category, TaxCategory)
		has_many(:product_images, ProductImage)
		# embeds_many(:prices, Price)
		# embeds_many(:properties, Property) -- not the same thing as a PropertyType
		# embeds_many(:stocks, Stock)
		timestamps()
	end
end