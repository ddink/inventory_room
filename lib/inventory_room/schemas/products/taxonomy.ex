# create_table "spree_taxonomies", force: :cascade do |t|
# 	t.string "name", null: false
# 	t.datetime "created_at", precision: 6
# 	t.datetime "updated_at", precision: 6
# 	t.integer "position", default: 0
# 	t.index ["position"], name: "index_spree_taxonomies_on_position"
# end

defmodule InventoryRoom.Products.Taxonomy do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "taxonomies" do
		field(:name, :string)
		field(:position, :integer)
		timestamps()
	end

	def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = taxonomy, params) do
		taxonomy |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = taxonomy, params) do
		taxonomy |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = taxonomy) do
    taxonomy |> changeset(%{})
  end
end