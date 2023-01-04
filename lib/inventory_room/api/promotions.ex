defmodule InventoryRoom.API.Promotions do
  alias InventoryRoom.Contexts.Promotions

  ##################
  # Promotions API #
  ##################

  # Create
  def create_promotion_category(params), do: Promotions.create_promotion_category(params)

  def create_promotion_code(params), do: Promotions.create_promotion_code(params)

  def create_promotion(params), do: Promotions.create_promotion(params)

  # Read
  def get_promotion_category(id), do: Promotions.get_promotion_category(id)

  def get_promotion_code(id), do: Promotions.get_promotion_code(id)

  def get_promotion(id), do: Promotions.get_promotion(id)

  # Update
  def update_promotion_category(schema, params), do: Promotions.update_promotion_category(schema, params)

  def update_promotion_code(schema, params), do: Promotions.update_promotion_code(schema,params)

  def update_promotion(schema, params), do: Promotions.update_promotion(schema, params)

  # Delete
  def delete_promotion_category(schema), do: Promotions.delete_promotion_category(schema)

  def delete_promotion_code(schema), do: Promotions.delete_promotion_code(schema)

  def delete_promotion(schema), do: Promotions.delete_promotion(schema)
end