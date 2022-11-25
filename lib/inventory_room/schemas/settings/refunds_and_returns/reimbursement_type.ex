# create_table "spree_reimbursement_types", force: :cascade do |t|
#   t.string "name"
#   t.boolean "active", default: true
#   t.boolean "mutable", default: true
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "type"
#   t.index ["type"], name: "index_spree_reimbursement_types_on_type"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.ReimbursementType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reimbursement_types" do
    field :name, :string
    field :active, :boolean
    field :mutable, :boolean
    field :type, :string
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = reimbursement_type, params) do
		reimbursement_type |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = reimbursement_type, params) do
		reimbursement_type |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = reimbursement_type) do
    reimbursement_type |> changeset(%{})
  end
end