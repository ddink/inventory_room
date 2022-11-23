# create_table "spree_adjustments", force: :cascade do |t|
#   t.string "source_type"
#   t.integer "source_id"
#   t.string "adjustable_type"
#   t.integer "adjustable_id", null: false
#   t.decimal "amount", precision: 10, scale: 2
#   t.string "label"
#   t.boolean "eligible", default: true
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "order_id", null: false
#   t.boolean "included", default: false
#   t.integer "promotion_code_id"
#   t.integer "adjustment_reason_id"
#   t.boolean "finalized", default: false, null: false
#   t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
#   t.index ["adjustable_id"], name: "index_adjustments_on_order_id"
#   t.index ["eligible"], name: "index_spree_adjustments_on_eligible"
#   t.index ["order_id"], name: "index_spree_adjustments_on_order_id"
#   t.index ["promotion_code_id"], name: "index_spree_adjustments_on_promotion_code_id"
#   t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.Adjustment do
  use Ecto.Schema
  alias InventoryRoom.Promotions.PromotionCode
  alias InventoryRoom.Settings.RefundsAndReturns.AdjustmentReason
  alias ShoppingCart.Orders.Order

  schema "adjustments" do
    field :amount, :decimal
    field :label, :string
    field :eligible, :boolean
    belongs_to :order, Order
    belongs_to :promotion_code, PromotionCode
    belongs_to :adjustment_reason, AdjustmentReason
    timestamps()
  end
end