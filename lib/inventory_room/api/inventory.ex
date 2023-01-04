defmodule InventoryRoom.API.Inventory do
  alias InventoryRoom.Contexts.Inventory
  
  #################
  # Inventory API #
  #################

  # Create
  def create_stock_item(params), do: Inventory.create_stock_item(params)


  # Read
  def get_stock_item(id), do: Inventory.get_stock_item(id)

  # Update
  def update_stock_item(item, params), do: Inventory.update_stock_item(item, params)

  # Delete
  def delete_stock_item(item), do: Inventory.delete_stock_item(item)
end