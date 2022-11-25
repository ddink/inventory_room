# create_table "spree_states", force: :cascade do |t|
#   t.string "name"
#   t.string "abbr"
#   t.integer "country_id"
#   t.datetime "updated_at", precision: 6
#   t.datetime "created_at", precision: 6
#   t.index ["country_id"], name: "index_spree_states_on_country_id"
# end

defmodule InventoryRoom.Settings.Zones.State do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Joins.ZoneMember
  alias InventoryRoom.Settings.Zones.Country

  schema "states" do
    field :name, :string
    field :abbr, :string
    belongs_to :country, Country
    has_many :zone_members, ZoneMember
    has_many :zones, through: [:zone_members, :zone]
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = state, params) do
		state |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = state, params) do
		state |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = state) do
    state |> changeset(%{})
  end
end