# create_table "spree_stock_locations", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.boolean "default", default: false, null: false
#   t.string "address1"
#   t.string "address2"
#   t.string "city"
#   t.integer "state_id"
#   t.string "state_name"
#   t.integer "country_id"
#   t.string "zipcode"
#   t.string "phone"
#   t.boolean "active", default: true
#   t.boolean "backorderable_default", default: false
#   t.boolean "propagate_all_variants", default: true
#   t.string "admin_name"
#   t.integer "position", default: 0
#   t.boolean "restock_inventory", default: true, null: false
#   t.boolean "fulfillable", default: true, null: false
#   t.string "code"
#   t.boolean "check_stock_on_transfer", default: true
#   t.index ["country_id"], name: "index_spree_stock_locations_on_country_id"
#   t.index ["state_id"], name: "index_spree_stock_locations_on_state_id"
# end

defmodule InventoryRoom.Settings.Shipping.StockLocation do
  use Ecto.Schema
  import Ecto.Changeset
  # alias InventoryRoom.Settings.Zones.{State, Country}
  # alias InventoryRoom.StockItems.StockItem

  schema "stock_locations" do
    field :name, :string
    field :default, :boolean
    field :address1, :string
    field :address2, :string
    field :city, :string
    # has_one :state_stock_location
    # has_one :state, through: [:state_stock_location, :state]
    # has_one :country_stock_location
    # has_one :country, through: [:country_stock_location, :country]
    # has_one :stock_item, StockItem
    field :zipcode, :string
    field :phone, :string
    field :active, :boolean
    field :backorderable_default, :boolean
    field :propagate_all_variants, :boolean
    field :internal_name, :string
    field :position, :integer
    field :restock_inventory, :boolean
    field :fulfillable, :boolean
    field :code, :string
    field :check_stock_on_transfer, :boolean
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    [:default, :backorderable_default, :propagate_all_variants]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = stock_location, params) do
		stock_location |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = stock_location, params) do
		stock_location 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = stock_location) do
    stock_location |> changeset(%{})
  end
end