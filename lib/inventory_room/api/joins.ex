defmodule InventoryRoom.API.Joins do
  alias InventoryRoom.Contexts.Joins

  # Create
  def create_product_option_type(params), do: Joins.create_product_option_type(params)

  def create_product_property(params), do: Joins.create_product_property(params)

  def create_product_taxon(params), do: Joins.create_product_taxon(params)

  def create_shipping_method_category(params), do: Joins.create_shipping_method_category(params)

  def create_shipping_method_stock_location(params), do: Joins.create_shipping_method_stock_location(params)

  def create_shipping_method_zone(params), do: Joins.create_shipping_method_zone(params)

  def create_store_payment_method(params), do: Joins.create_store_payment_method(params)

  def create_variant_option_value(params), do: Joins.create_variant_option_value(params)

  def create_zone_member(params), do: Joins.create_zone_member(params)

  # Read
  def get_product_option_type(id), do: Joins.get_product_option_type(id)

  def get_product_property(id), do: Joins.get_product_property(id)

  def get_product_taxon(id), do: Joins.get_product_taxon(id)

  def get_shipping_method_category(id), do: Joins.get_shipping_method_category(id)

  def get_shipping_method_stock_location(id), do: Joins.get_shipping_method_stock_location(id)

  def get_shipping_method_zone(id), do: Joins.get_shipping_method_zone(id)

  def get_store_payment_method(id), do: Joins.get_store_payment_method(id)

  def get_variant_option_value(id), do: Joins.get_variant_option_value(id)

  def get_zone_member(id), do: Joins.get_zone_member(id)

  # Update
  def update_product_option_type(schema, params), do: Joins.update_product_option_type(schema, params)

  def update_product_property(schema, params), do: Joins.update_product_property(schema, params)

  def update_product_taxon(schema, params), do: Joins.update_product_taxon(schema, params)

  def update_shipping_method_category(schema, params), do: Joins.update_shipping_method_category(schema, params)

  def update_shipping_method_stock_location(schema, params), do: Joins.update_shipping_method_stock_location(schema, params)

  def update_shipping_method_zone(schema, params), do: Joins.update_shipping_method_zone(schema, params)

  def update_store_payment_method(schema, params), do: Joins.update_store_payment_method(schema, params)

  def update_variant_option_value(schema, params), do: Joins.update_variant_option_value(schema, params)

  def update_zone_member(schema, params), do: Joins.update_zone_member(schema, params)

  # Delete
  def delete_product_option_type(schema), do: Joins.delete_product_option_type(schema)

  def delete_product_property(schema), do: Joins.delete_product_property(schema)

  def delete_product_taxon(schema), do: Joins.delete_product_taxon(schema)

  def delete_shipping_method_category(schema), do: Joins.delete_shipping_method_category(schema)

  def delete_shipping_method_stock_location(schema), do: Joins.delete_shipping_method_stock_location(schema)

  def delete_shipping_method_zone(schema), do: Joins.delete_shipping_method_zone(schema)

  def delete_store_payment_method(schema), do: Joins.delete_store_payment_method(schema)

  def delete_variant_option_value(schema), do: Joins.delete_variant_option_value(schema)

  def delete_zone_member(schema), do: Joins.delete_zone_member(schema)
end