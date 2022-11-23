# create_table "spree_payments", force: :cascade do |t|
#   t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
#   t.integer "order_id"
#   t.string "source_type"
#   t.integer "source_id"
#   t.integer "payment_method_id"
#   t.string "state"
#   t.string "response_code"
#   t.string "avs_response"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "number"
#   t.string "cvv_response_code"
#   t.string "cvv_response_message"
#   t.index ["order_id"], name: "index_spree_payments_on_order_id"
#   t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id"
#   t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type"
# end

defmodule InventoryRoom.Orders.Payment do
  use Ecto.Schema
  alias InventoryRoom.Settings.PaymentMethod
  alias ShoppingCart.Orders.Order

  schema "payments" do
    field :amount, :decimal
    field :state, :string
    field :response_code, :string
    field :avs_response, :string
    field :number, :string
    field :cvv_response_code, :string
    field :cvv_response_message, :string
    belongs_to :order, Order
    belongs_to :payment_methods, PaymentMethod
    timestamps()
  end
end