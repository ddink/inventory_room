# create_table "spree_countries", force: :cascade do |t|
#   t.string "iso_name"
#   t.string "iso"
#   t.string "iso3"
#   t.string "name"
#   t.integer "numcode"
#   t.boolean "states_required", default: false
#   t.datetime "updated_at", precision: 6
#   t.datetime "created_at", precision: 6
#   t.index ["iso"], name: "index_spree_countries_on_iso"
# end

defmodule InventoryRoom.Settings.Zones.Country do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Joins.ZoneMember

  schema "countries" do
    field :iso_name, :string
    field :iso, :string
    field :iso3, :string
    field :name, :string
    field :numcode, :integer
    field :states_required, :boolean
    has_many :zone_members, ZoneMember
    has_many :zones, through: [:zone_members, :zone]
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = country, params) do
		country |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = country, params) do
		country |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = country) do
    country |> changeset(%{})
  end
end