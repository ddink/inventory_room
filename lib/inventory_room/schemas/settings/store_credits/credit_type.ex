# create_table "spree_store_credit_types", force: :cascade do |t|
#   t.string "name"
#   t.integer "priority"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["priority"], name: "index_spree_store_credit_types_on_priority"
# end

defmodule InventoryRoom.Settings.StoreCredits.CreditType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_types" do
    field :name, :string
    field :priority, :integer
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = type, params) do
		type |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = type, params) do
		type |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = type) do
    type |> changeset(%{})
  end
end