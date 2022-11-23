# create_table "spree_store_credit_types", force: :cascade do |t|
#   t.string "name"
#   t.integer "priority"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["priority"], name: "index_spree_store_credit_types_on_priority"
# end

defmodule InventoryRoom.Settings.StoreCredits.CreditType do
  use Ecto.Schema

  schema "credit_types" do
    field :name, :string
    field :priority, :integer
    timestamps()
  end
end