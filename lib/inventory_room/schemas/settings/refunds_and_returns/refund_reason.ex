# create_table "spree_refund_reasons", force: :cascade do |t|
#   t.string "name"
#   t.boolean "active", default: true
#   t.boolean "mutable", default: true
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "code"
# end

defmodule InventoryRoom.Settings.RefundsAndReturns.RefundReason do
  use Ecto.Schema
  import Ecto.Changeset

  schema "refund_reasons" do
    field :name, :string
    field :active, :boolean
    field :mutable, :boolean
    field :code, :string
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