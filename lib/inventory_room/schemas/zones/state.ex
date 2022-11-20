# create_table "spree_states", force: :cascade do |t|
#   t.string "name"
#   t.string "abbr"
#   t.integer "country_id"
#   t.datetime "updated_at", precision: 6
#   t.datetime "created_at", precision: 6
#   t.index ["country_id"], name: "index_spree_states_on_country_id"
# end

defmodule InventoryRoom.Settings.Zones.State do
  import Ecto.Schema

  schema "states" do
    field :name, :string
    field :abbr, :string
    belongs_to :country, Country
    timestamps()
  end
end