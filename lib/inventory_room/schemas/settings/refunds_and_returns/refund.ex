# create_table "spree_refunds", force: :cascade do |t|
#   t.integer "payment_id"
#   t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
#   t.string "transaction_id"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "refund_reason_id"
#   t.integer "reimbursement_id"
#   t.index ["payment_id"], name: "index_spree_refunds_on_payment_id"
#   t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id"
#   t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.Refund do
  use Ecto.Schema
  alias InventoryRoom.Orders.Payment
  alias InventoryRoom.Settings.RefundsAndReturns.{RefundReason, Reimbursement}

  schema "refunds" do
    field :amount, :decimal
    # field :transaction_id, :string
    belongs_to :payment, Payment
    belongs_to :refund_reason, RefundReason
    belongs_to :reimbursement, Reimbursement
    timestamps()
  end
end