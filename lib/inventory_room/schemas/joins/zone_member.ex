defmodule InventoryRoom.Joins.ZoneMember do
  use Ecto.Schema
  alias InventoryRoom.Settings.Zones.{
    Country, 
    State, 
    Zone
  }

  schema "zone_members" do
    belongs_to :country, Country
    belongs_to :state, State
    belongs_to :zone, Zone
  end
end