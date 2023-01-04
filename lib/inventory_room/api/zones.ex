defmodule InventoryRoom.API.Zones do
  alias InventoryRoom.Contexts.Zones

  #############
  # Zones API #
  #############

  # Create
  def create_country(params), do: Zones.create_country(params)

  def create_state(params), do: Zones.create_state(params)

  def create_zone(params), do: Zones.create_zone(params)

  # Read
  def get_country(id), do: Zones.get_country(id)

  def get_state(id), do: Zones.get_state(id)

  def get_zone(id), do: Zones.get_zone(id)

  # Update
  def update_country(schema, params), do: Zones.update_country(schema, params)

  def update_state(schema, params), do: Zones.update_state(schema, params)

  def update_zone(schema, params), do: Zones.update_zone(schema, params)

  # Delete
  def delete_country(schema), do: Zones.delete_country(schema)

  def delete_state(schema), do: Zones.delete_state(schema)

  def delete_zone(schema), do: Zones.delete_zone(schema)
end