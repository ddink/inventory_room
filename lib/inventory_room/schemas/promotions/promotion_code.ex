# create_table "spree_promotion_codes", force: :cascade do |t|
#   t.integer "promotion_id", null: false
#   t.string "value", null: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id"
#   t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true
# end

defmodule InventoryRoom.Promotions.PromotionCode do
  use Ecto.Schema
  alias InventoryRoom.Promotions.Promotion

  schema "promotion_codes" do
    belongs_to :promotion, Promotion
    field :value, :string
    timestamps()
  end
end