# create_table "spree_customer_returns", force: :cascade do |t|
#   t.string "number"
#   t.integer "stock_location_id"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.CustomerReturn do
  use Ecto.Schema
  alias InventoryRoom.Settings.Shipping.StockLocation

  schema "customer_returns" do
    field :number, :string
    belongs_to :stock_location, StockLocation
    timestamps()
  end
end