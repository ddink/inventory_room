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
  import Ecto.Changeset
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

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = authorization, params) do
		authorization |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = authorization, params) do
		authorization |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = authorization) do
    authorization |> changeset(%{})
  end
end