# create_table "spree_return_authorizations", force: :cascade do |t|
#   t.string "number"
#   t.string "state"
#   t.integer "order_id"
#   t.text "memo"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "stock_location_id"
#   t.integer "return_reason_id"
#   t.index ["return_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.ReturnAuthorization do
  use Ecto.Schema
  alias InventoryRoom.Settings.Shipping.StockLocation
  alias ShoppingCart.Orders.Order

  schema "return_authorizations" do
    field :number, :string
    field :state, :string
    field :memo, :string
    belongs_to :order, Order
    belongs_to :stock_location, StockLocation
    timestamps()
  end
end