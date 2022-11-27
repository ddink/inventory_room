# create_table "spree_customer_returns", force: :cascade do |t|
#   t.string "number"
#   t.integer "stock_location_id"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.CustomerReturn do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.Shipping.StockLocation

  schema "customer_returns" do
    field :number, :string
    belongs_to :stock_location, StockLocation
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = customer_return, params) do
		customer_return |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = customer_return, params) do
		customer_return 
    |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = customer_return) do
    customer_return |> changeset(%{})
  end
end