# create_table "spree_store_credit_categories", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.StoreCredits.CreditCategory do
  use Ecto.Schema

  schema "credit_categories" do
    field :name, :string
    timestamps()
  end
end