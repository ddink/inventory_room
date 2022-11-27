# create_table "spree_reimbursements", force: :cascade do |t|
#   t.string "number"
#   t.string "reimbursement_status"
#   t.integer "customer_return_id"
#   t.integer "order_id"
#   t.decimal "total", precision: 10, scale: 2
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id"
#   t.index ["order_id"], name: "index_spree_reimbursements_on_order_id"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.Reimbursement do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.RefundsAndReturns.CustomerReturn
  alias ShoppingCart.Orders.Order

  schema "reimbursements" do
    field :number, :string
    field :reimbursement_status, :string
    field :total, :decimal
    belongs_to :customer_return, CustomerReturn
    belongs_to :order, Order
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = reimbursement, params) do
		reimbursement |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = reimbursement, params) do
		reimbursement 
    |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = reimbursement) do
    reimbursement |> changeset(%{})
  end
end