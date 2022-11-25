# create_table "spree_store_credit_categories", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.StoreCredits.CreditCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_categories" do
    field :name, :string
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = category, params) do
		category |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = category, params) do
		category |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = category) do
    category |> changeset(%{})
  end
end