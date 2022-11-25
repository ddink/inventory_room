# create_table "spree_adjustment_reasons", force: :cascade do |t|
#   t.string "name"
#   t.string "code"
#   t.boolean "active", default: true
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["active"], name: "index_spree_adjustment_reasons_on_active"
#   t.index ["code"], name: "index_spree_adjustment_reasons_on_code"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.AdjustmentReason do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "adjustment_reasons" do
    field :name, :string
    field :code, :string
    field :active, :boolean
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = reason, params) do
		reason |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = reason, params) do
		reason |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = reason) do
    reason |> changeset(%{})
  end
end