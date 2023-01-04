defmodule InventoryRoom.API.Taxes do
  alias InventoryRoom.Contexts.Taxes

  #############
  # Taxes API #
  #############

  # Create
  def create_tax_category(params), do: Taxes.create_tax_category(params)

  def create_tax_rate(params), do: Taxes.create_tax_rate(params)

  # Read
  def get_tax_category(id), do: Taxes.get_tax_category(id)

  def get_tax_rate(id), do: Taxes.get_tax_rate(id)

  # Update
  def update_tax_category(schema, params), do: Taxes.update_tax_category(schema, params)

  def update_tax_rate(schema, params), do: Taxes.update_tax_rate(schema, params)

  # Delete
  def delete_tax_category(schema), do: Taxes.delete_tax_category(schema)

  def delete_tax_rate(schema), do: Taxes.delete_tax_rate(schema)
end