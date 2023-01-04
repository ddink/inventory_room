defmodule InventoryRoom.API.Shipping do
  alias InventoryRoom.Contexts.Shipping

  ################
  # Shipping API #
  ################

  # Create
  def create_shipment(params), do: Shipping.create_shipment(params)

  def create_shipping_category(params), do: Shipping.create_shipping_category(params)

  def create_shipping_method(params), do: Shipping.create_shipping_method(params)

  def create_stock_location(params), do: Shipping.create_stock_location(params)

  # Read
  def get_shipment(id), do: Shipping.get_shipment(id)

  def get_shipping_category(id), do: Shipping.get_shipping_category(id)

  def get_shipping_method(id), do: Shipping.get_shipping_method(id)

  def get_stock_location(id), do: Shipping.get_stock_location(id)

  # Update
  def update_shipment(schema, params), do: Shipping.update_shipment(schema, params)

  def update_shipping_category(schema, params), do: Shipping.update_shipping_category(schema, params)

  def update_shipping_method(schema, params), do: Shipping.update_shipping_method(schema, params)

  def update_stock_location(schema, params), do: Shipping.update_stock_location(schema, params)

  # Delete
  def delete_shipment(schema), do: Shipping.delete_shipment(schema)

  def delete_shipping_category(schema), do: Shipping.delete_shipping_category(schema)

  def delete_shipping_method(schema), do: Shipping.delete_shipping_method(schema)

  def delete_stock_location(schema), do: Shipping.delete_stock_location(schema)  
end