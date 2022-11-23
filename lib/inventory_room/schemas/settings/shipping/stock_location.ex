defmodule InventoryRoom.Settings.Shipping.StockLocation do
  use Ecto.Schema
  alias InventoryRoom.Settings.Zones.{State, Country}
  # alias InventoryRoom.StockItems.StockItem

  schema "stock_locations" do
    field :name, :string
    field :default, :boolean
    field :address1, :string
    field :address2, :string
    field :city, :string
    has_one :state, State
    has_one :country, Country
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
end