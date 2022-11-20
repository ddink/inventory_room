# create_table "spree_countries", force: :cascade do |t|
#   t.string "iso_name"
#   t.string "iso"
#   t.string "iso3"
#   t.string "name"
#   t.integer "numcode"
#   t.boolean "states_required", default: false
#   t.datetime "updated_at", precision: 6
#   t.datetime "created_at", precision: 6
#   t.index ["iso"], name: "index_spree_countries_on_iso"
# end

defmodule InventoryRoom.Settings.Zones.Country do
  # import Ecto.Schema

  # schema "countries" do
    # field :iso_name, :string
    # field :iso, :string
    # field :iso3, :string
    # field :name, :string
    # field :numcode, :integer
    # field :states_required, :boolean -- should default to false
    # timestamps()
  # end
end