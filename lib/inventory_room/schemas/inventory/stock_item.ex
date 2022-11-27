# create_table "spree_stock_items", force: :cascade do |t|
#   t.integer "stock_location_id"
#   t.integer "variant_id"
#   t.integer "count_on_hand", default: 0, null: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.boolean "backorderable", default: false
#   t.datetime "deleted_at"
#   t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at"
#   t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id"
#   t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id"

#   if connection.supports_partial_index?
#     t.index ["variant_id", "stock_location_id"], name: "index_spree_stock_items_on_variant_id_and_stock_location_id", unique: true, where: "deleted_at is null"
#   end
# end

defmodule InventoryRoom.Inventory.StockItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.Shipping.StockLocation
  alias InventoryRoom.Products.Variant

  schema "stock_items" do
    belongs_to(:stock_location, StockLocation)
    belongs_to(:variant, Variant)
    field(:count_on_hand, :integer)
    field(:backorderable, :boolean)
    field(:deleted_at, :naive_datetime)
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    [:count_on_hand]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = item, params) do
		item |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = item, params) do
		item 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = item) do
    item |> changeset(%{})
  end
end