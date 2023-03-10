# create_table "spree_tax_rates", force: :cascade do |t|
#   t.decimal "amount", precision: 8, scale: 5
#   t.integer "zone_id"
#   t.integer "tax_category_id"
#   t.boolean "included_in_price", default: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "name"
#   t.boolean "show_rate_in_label", default: true
#   t.datetime "deleted_at"
#   t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at"
#   t.index ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id"
#   t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id"
# end

defmodule InventoryRoom.Settings.Taxes.TaxRate do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.Zones.Zone
  alias InventoryRoom.Settings.Taxes.TaxCategory
  
  schema "tax_rates" do
    field :amount, :decimal
    belongs_to :zone, Zone
    has_one :tax_category, TaxCategory
    field :included_in_price, :boolean
    field :name, :string
    field :show_rate_in_label,  :boolean
    field :deleted_at, :naive_datetime
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = rate, params) do
		rate |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = rate, params) do
		rate |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = rate) do
    rate |> changeset(%{})
  end
end