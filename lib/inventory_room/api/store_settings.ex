defmodule InventoryRoom.API.StoreSettings do
  alias InventoryRoom.Contexts.StoreSettings

  ######################
  # Store Settings API #
  ######################

  # Create
  def create_payment_method(params), do: StoreSettings.create_payment_method(params)

  def create_store(params), do: StoreSettings.create_store(params)

  # Read
  def get_payment_method(id), do: StoreSettings.get_payment_method(id)

  def get_store(id), do: StoreSettings.get_store(id)

  # Update
  def update_payment_method(schema, params), do: StoreSettings.update_payment_method(schema, params)

  def update_store(schema, params), do: StoreSettings.update_store(schema, params)

  # Delete
  def delete_payment_method(schema), do: StoreSettings.delete_payment_method(schema)

  def delete_store(schema), do: StoreSettings.delete_store(schema)
end