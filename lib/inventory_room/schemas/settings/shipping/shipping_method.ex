# create_table "spree_shipping_methods", force: :cascade do |t|
#   t.string "name"
#   t.string "display_on"
#   t.datetime "deleted_at"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "tracking_url"
#   t.string "admin_name"
#   t.integer "tax_category_id"
#   t.string "code"
#   t.boolean "available_to_all", default: true
#   t.string "carrier"
#   t.string "service_level"
#   t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id"
# end

defmodule InventoryRoom.Settings.Shipping.ShippingMethod do
  use Ecto.Schema
  alias InventoryRoom.Joins.{
    ShippingMethodCategory,
    ShippingMethodStockLocation,
    ShippingMethodZone
  }
  alias InventoryRoom.Settings.Taxes.TaxCategory

  schema "shipping_methods" do
    field :name, :string
    field :display_on, :string
    field :deleted_at, :naive_datetime
    field :tracking_url, :string
    field :internal_name, :string
    field :code, :string
    field :available_to_all, :boolean
    field :carrier, :string
    field :service_level, :string
    belongs_to :tax_category, TaxCategory
    has_many :shipping_method_categories, ShippingMethodCategory
    has_many :shipping_category, through: [:shipping_method_categories, :shipping_category]
    has_many :shipping_method_stock_locations, ShippingMethodStockLocation
    has_many :stock_locations, through: [:shipping_method_stock_locations, :stock_location]
    has_many :shipping_method_zones, ShippingMethodZone
    has_many :zones, through: [:shipping_method_zones, :zone]
    timestamps()
  end
end