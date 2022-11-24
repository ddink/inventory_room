# create_table "spree_properties", force: :cascade do |t|
# 	t.string "name"
# 	t.string "presentation", null: false
# 	t.datetime "created_at", precision: 6
# 	t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Products.Property do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "properties" do
		field(:name, :string)
		field(:presentation, :string)
		timestamps()
	end

	def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = property, params) do
		property |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = property, params) do
		property |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = property) do
    property |> changeset(%{})
  end
end