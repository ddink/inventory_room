# create_table "spree_taxons", force: :cascade do |t|
# 	t.integer "parent_id"
# 	t.integer "position", default: 0
# 	t.string "name", null: false
# 	t.string "permalink"
# 	t.integer "taxonomy_id"
# 	t.integer "lft"
# 	t.integer "rgt"
# 	t.string "icon_file_name"
# 	t.string "icon_content_type"
# 	t.integer "icon_file_size"
# 	t.datetime "icon_updated_at"
# 	t.text "description"
# 	t.datetime "created_at", precision: 6
# 	t.datetime "updated_at", precision: 6
# 	t.string "meta_title"
# 	t.string "meta_description"
# 	t.string "meta_keywords"
# 	t.integer "depth"
# 	t.index ["parent_id"], name: "index_taxons_on_parent_id"
# 	t.index ["permalink"], name: "index_taxons_on_permalink"
# 	t.index ["position"], name: "index_spree_taxons_on_position"
# 	t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"
# end

defmodule InventoryRoom.Products.Taxon do
	use Ecto.Schema
	import Ecto.Changeset
	alias InventoryRoom.Products.Taxonomy
	
	schema "taxons" do
		field(:parent_id, :integer)
		field(:position, :integer)
		field(:name, :string)
		field(:permalink, :string)
		belongs_to(:taxonomy, Taxonomy)
		field(:icon_file_name, :string)
		field(:icon_content_type, :string)
		field(:icon_file_size, :integer)
		field(:icon_updated_at, :naive_datetime)
		field(:description, :string)
		field(:meta_title, :string)
		field(:meta_description, :string)
		field(:meta_keywords, :string)
		timestamps()
	end

	def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    [:name]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = taxon, params) do
		taxon |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = taxon, params) do
		taxon 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = taxon) do
    taxon |> changeset(%{})
  end
end