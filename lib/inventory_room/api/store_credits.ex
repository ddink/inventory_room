defmodule InventoryRoom.API.StoreCredits do
  alias InventoryRoom.Contexts.StoreCredits

  #####################
  # Store Credits API #
  #####################

  # Create
  def create_credit_category(params), do: StoreCredits.create_credit_category(params)

  def create_credit_reason(params), do: StoreCredits.create_credit_reason(params)

  def create_credit_type(params), do: StoreCredits.create_credit_type(params)

  def create_credit(params), do: StoreCredits.create_credit(params)

  # Read
  def get_credit_category(id), do: StoreCredits.get_credit_category(id)

  def get_credit_reason(id), do: StoreCredits.get_credit_reason(id)

  def get_credit_type(id), do: StoreCredits.get_credit_type(id)

  def get_credit(id), do: StoreCredits.get_credit(id)

  # Update
  def update_credit_category(schema, params), do: StoreCredits.update_credit_category(schema, params)

  def update_credit_reason(schema, params), do: StoreCredits.update_credit_reason(schema, params)

  def update_credit_type(schema, params), do: StoreCredits.update_credit_type(schema, params)

  def update_credit(schema, params), do: StoreCredits.update_credit(schema, params)

  # Delete
  def delete_credit_category(schema), do: StoreCredits.delete_credit_category(schema)

  def delete_credit_reason(schema), do: StoreCredits.delete_credit_reason(schema)

  def delete_credit_type(schema), do: StoreCredits.delete_credit_type(schema)

  def delete_credit(schema), do: StoreCredits.delete_credit(schema)
end