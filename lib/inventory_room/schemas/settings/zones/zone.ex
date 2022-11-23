# create_table "spree_zones", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.boolean "default_tax", default: false
#   t.integer "zone_members_count", default: 0
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.Zones.Zone do
  use Ecto.Schema
  alias InventoryRoom.Settings.Zones.{State, Country}

  schema "zones" do
    field :name, :string
    field :description, :string
    field :zone_members_count, :integer
    field :type, :string # -- should be validated through inclusion of ["country-based", "state-based"]
    has_many :states, State
    has_many :countries, Country
    timestamps()
  end
end