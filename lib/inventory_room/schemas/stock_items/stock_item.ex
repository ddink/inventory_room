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

defmodule InventoryRoom.StockItems.StockItem do
  import Ecto.Schema

  schema "stock_items" do
    belongs_to(:stock_location, StockLocation)
    belongs_to(:variant, Variant)
    field(:count_on_hand, :integer) -- should default to 0
    field(:backorderable, :boolean) -- should default to false
    field(:deleted_at, :naive_datetime)
    timestamps()
  end
end