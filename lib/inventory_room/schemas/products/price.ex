# create_table "spree_prices", force: :cascade do |t|
#   t.integer "variant_id", null: false
#   t.decimal "amount", precision: 10, scale: 2
#   t.string "currency"
#   t.datetime "deleted_at"
#   t.boolean "is_default", default: true, null: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "country_iso", limit: 2
#   t.index ["country_iso"], name: "index_spree_prices_on_country_iso"
#   t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency"
# end

defmodule InventoryRoom.Products.Price do
  use Ecto.Schema
  alias InventoryRoom.Products.Variant
  # alias InventoryRoom.Products.Product

  schema "prices" do
    belongs_to :variant, Variant
    field :amount, :decimal
    field :currency, :string
    field :deleted_at, :naive_datetime
    field :is_default, :boolean
    field :country_iso, :string
    # has_many :images, Image
    timestamps()
  end
end