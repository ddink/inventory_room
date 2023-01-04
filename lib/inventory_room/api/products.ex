defmodule InventoryRoom.API.Products do
  alias InventoryRoom.Contexts.Products

  ################
  # Products API #
  ################

  # Create
  def create_option_type(params), do: Products.create_option_type(params)

  def create_option_value(params), do: Products.create_option_value(params)

  def create_price(params), do: Products.create_price(params)

  def create_property(params), do: Products.create_property(params)

  def create_taxon(params), do: Products.create_taxon(params)

  def create_taxonomy(params), do: Products.create_taxonomy(params)    

  def create_product(params), do: Products.create_product(params)

  def create_product_image(params), do: Products.create_product_image(params)

  def create_variant(params), do: Products.create_variant(params)

  def create_variant_image(params), do: Products.create_variant_image(params)

  # Read
  def get_option_type(id), do: Products.get_option_type(id)

  def get_option_value(id), do: Products.get_option_value(id)

  def get_price(id), do: Products.get_price(id)

  def get_property(id), do: Products.get_property(id)

  def get_taxon(id), do: Products.get_taxon(id)

  def get_taxonomy(id), do: Products.get_taxonomy(id)

  def get_product(id), do: Products.get_product(id)

  def get_product_image(id), do: Products.get_product_image(id)

  def get_variant(id), do: Products.get_variant(id)

  def get_variant_image(id), do: Products.get_variant_image(id)

  # Update
  def update_option_type(schema, params), do: Products.update_option_type(schema, params)

  def update_option_value(schema, params), do: Products.update_option_value(schema, params)

  def update_price(schema, params), do: Products.update_price(schema, params)

  def update_property(schema, params), do: Products.update_property(schema, params)

  def update_taxon(schema, params), do: Products.update_taxon(schema, params)

  def update_taxonomy(schema, params), do: Products.update_taxonomy(schema, params)

  def update_product(schema, params), do: Products.update_product(schema, params)

  def update_product_image(schema, params), do: Products.update_product_image(schema, params)

  def update_variant(schema, params), do: Products.update_variant(schema, params)

  def update_variant_image(schema, params), do: Products.update_variant_image(schema, params)

  # Delete

  def delete_option_type(schema), do: Products.delete_option_type(schema)

  def delete_option_value(schema), do: Products.delete_option_value(schema)

  def delete_price(schema), do: Products.delete_price(schema)

  def delete_property(schema), do: Products.delete_property(schema)

  def delete_taxon(schema), do: Products.delete_taxon(schema)

  def delete_taxonomy(schema), do: Products.delete_taxonomy(schema)

  def delete_product(schema), do: Products.delete_product(schema)

  def delete_product_image(schema), do: Products.delete_product_image(schema)

  def delete_variant(schema), do: Products.delete_variant(schema)

  def delete_variant_image(schema), do: Products.delete_variant_image(schema)
end