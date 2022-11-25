# create_table "spree_zones", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.boolean "default_tax", default: false
#   t.integer "zone_members_count", default: 0
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
# end

defmodule InventoryRoom.Settings.Zones.Zone do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Joins.ZoneMember

  schema "zones" do
    field :name, :string
    field :description, :string
    field :zone_members_count, :integer
    field :type, :string # -- should be validated through inclusion of ["country-based", "state-based"]
    field :default_tax, :boolean
    has_many :zone_members, ZoneMember
    has_many :states, through: [:zone_members, :state]
    has_many :countries, through: [:zone_members, :country]
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = zone, params) do
		zone |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = zone, params) do
		zone |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = zone) do
    zone |> changeset(%{})
  end
end