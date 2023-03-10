# create_table "spree_shipments", force: :cascade do |t|
#   t.string "tracking"
#   t.string "number"
#   t.decimal "cost", precision: 10, scale: 2, default: "0.0"
#   t.datetime "shipped_at"
#   t.integer "order_id"
#   t.integer "deprecated_address_id"
#   t.string "state"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "stock_location_id"
#   t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
#   t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
#   t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
#   t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
#   t.index ["deprecated_address_id"], name: "index_spree_shipments_on_deprecated_address_id"
#   t.index ["number"], name: "index_shipments_on_number"
#   t.index ["order_id"], name: "index_spree_shipments_on_order_id"
#   t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id"
# end

defmodule InventoryRoom.Settings.Shipping.Shipment do
  use Ecto.Schema
  import Ecto.Changeset
  alias ShoppingCart.Orders.Order
  alias InventoryRoom.Settings.Shipping.StockLocation

  schema "shipments" do
    field :tracking_number, :string
    field :cost, :decimal
    field :shipped_at, :naive_datetime
    # field :deprecated_address_id, :integer
    field :state, :string
    field :adjustment_total, :decimal
    field :additional_tax_total, :decimal
    field :promo_total, :decimal
    field :included_tax_total, :decimal
    belongs_to :order, Order
    belongs_to :stock_location, StockLocation
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def decimal_fields do
    [
      :cost, 
      :adjustment_total, 
      :additional_tax_total, 
      :promo_total, 
      :included_tax_total
    ]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = shipment, params) do
		shipment |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = shipment, params) do
		shipment |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = shipment) do
    shipment |> changeset(%{})
  end
end