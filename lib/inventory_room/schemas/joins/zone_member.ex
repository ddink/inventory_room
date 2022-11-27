defmodule InventoryRoom.Joins.ZoneMember do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.Zones.{
    Country, 
    State, 
    Zone
  }

  schema "zone_members" do
    belongs_to :country, Country
    belongs_to :state, State
    belongs_to :zone, Zone
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    fields() -- [:country_id, :state_id]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = join, params) do
		join |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = join, params) do
		join 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = join) do
    join |> changeset(%{})
  end
end