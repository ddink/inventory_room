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
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Joins.VariantOptionValue
  alias InventoryRoom.Products.{Product, VariantImage}
  alias InventoryRoom.Settings.Taxes.TaxCategory
  alias InventoryRoom.Inventory.StockItem

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
    belongs_to :tax_category, TaxCategory
    has_many :variant_images, VariantImage
    has_one :stock_item, StockItem
    has_many :variant_option_values, VariantOptionValue
    has_many :option_values, through: [:variant_option_values, :option_value]
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    [:sku]
  end

  def decimal_fields do
    [:weight, :height, :width, :depth, :cost_price]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = variant, params) do
		variant |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = variant, params) do
		variant 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = variant) do
    variant |> changeset(%{})
  end
end