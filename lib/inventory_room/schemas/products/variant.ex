# create_table "spree_variants", force: :cascade do |t|
#   t.string "sku", default: "", null: false
#   t.decimal "weight", precision: 8, scale: 2, default: "0.0"
#   t.decimal "height", precision: 8, scale: 2
#   t.decimal "width", precision: 8, scale: 2
#   t.decimal "depth", precision: 8, scale: 2
#   t.datetime "deleted_at"
#   t.boolean "is_master", default: false
#   t.integer "product_id"
#   t.decimal "cost_price", precision: 10, scale: 2
#   t.integer "position"
#   t.string "cost_currency"
#   t.boolean "track_inventory", default: true
#   t.integer "tax_category_id"
#   t.datetime "updated_at", precision: 6
#   t.datetime "created_at", precision: 6
#   t.index ["position"], name: "index_spree_variants_on_position"
#   t.index ["product_id"], name: "index_spree_variants_on_product_id"
#   t.index ["sku"], name: "index_spree_variants_on_sku"
#   t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id"
#   t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory"
# end

defmodule InventoryRoom.Products.Variant do
  import Ecto.Schema

  schema "variants" do
    field :sku, :string
    field :weight, :decimal
    field :height, :decimal
    field :width, :decimal
    field :depth, :decimal
    field :deleted_at, :naive_datetime
    field :is_master, :boolean
    belongs_to :product, Product
    field :cost_price, :decimal
    field :position, :integer
    field :cost_currency, :string
    field :track_inventory, :boolean
    has_one :tax_category, TaxCategory
    has_many :variant_images, VariantImage
    timestamps()
  end
end