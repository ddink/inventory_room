# create_table "spree_tax_categories", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.boolean "is_default", default: false
#   t.datetime "deleted_at"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "tax_code"
# end

defmodule InventoryRoom.Settings.Taxes.TaxCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tax_categories" do
    field :name, :string
    field :description, :string
    field :is_default, :boolean
    field :tax_code, :string
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