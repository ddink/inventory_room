defmodule InventoryRoom.Contexts.Joins do
  alias StoreRepo.Repo
  alias InventoryRoom.Joins.{
    ProductOptionType,
    ProductProperty,
    ProductTaxon,
    ShippingMethodCategory,
    ShippingMethodStockLocation,
    ShippingMethodZone,
    StorePaymentMethod,
    VariantOptionValue,
    ZoneMember
    
  }

  # Create
  def create_product_option_type(params) do
    %ProductOptionType{}
    |> ProductOptionType.create_changeset(params)
    |> Repo.insert()
  end

  def create_product_property(params) do
    %ProductProperty{}
    |> ProductProperty.create_changeset(params)
    |> Repo.insert()
  end

  def create_product_taxon(params) do
    %ProductTaxon{}
    |> ProductTaxon.create_changeset(params)
    |> Repo.insert()
  end

  def create_shipping_method_category(params) do
    %ShippingMethodCategory{}
    |> ShippingMethodCategory.create_changeset(params)
    |> Repo.insert()
  end

  def create_shipping_method_stock_location(params) do
    %ShippingMethodStockLocation{}
    |> ShippingMethodStockLocation.create_changeset(params)
    |> Repo.insert()
  end

  def create_shipping_method_zone(params) do
    %ShippingMethodZone{}
    |> ShippingMethodZone.create_changeset(params)
    |> Repo.insert()
  end

  def create_store_payment_method(params) do
    %StorePaymentMethod{}
    |> StorePaymentMethod.create_changeset(params)
    |> Repo.insert()
  end

  def create_variant_option_value(params) do
    %VariantOptionValue{}
    |> VariantOptionValue.create_changeset(params)
    |> Repo.insert()
  end

  def create_zone_member(params) do
    %ZoneMember{}
    |> ZoneMember.create_changeset(params)
    |> Repo.insert()
  end

  # Read
  def get_product_option_type(id), do: Repo.get(ProductOptionType, id)

  def get_product_property(id), do: Repo.get(ProductProperty, id)

  def get_product_taxon(id), do: Repo.get(ProductTaxon, id)

  def get_shipping_method_category(id), do: Repo.get(ShippingMethodCategory, id)

  def get_shipping_method_stock_location(id), do: Repo.get(ShippingMethodStockLocation, id)

  def get_shipping_method_zone(id), do: Repo.get(ShippingMethodZone, id)

  def get_store_payment_method(id), do: Repo.get(StorePaymentMethod, id)

  def get_variant_option_value(id), do: Repo.get(VariantOptionValue, id)

  def get_zone_member(id), do: Repo.get(ZoneMember, id)

  # Update
  def update_product_option_type(%ProductOptionType{} = schema, params) do
    schema
    |> ProductOptionType.changeset(params)
    |> Repo.update()
  end

  def update_product_property(%ProductProperty{} = schema, params) do
    schema
    |> ProductProperty.changeset(params)
    |> Repo.update()
  end

  def update_product_taxon(%ProductTaxon{} = schema, params) do
    schema
    |> ProductTaxon.changeset(params)
    |> Repo.update()
  end

  def update_shipping_method_category(%ShippingMethodCategory{} = schema, params) do
    schema
    |> ShippingMethodCategory.changeset(params)
    |> Repo.update()
  end

  def update_shipping_method_stock_location(%ShippingMethodStockLocation{} = schema, params) do
    schema
    |> ShippingMethodStockLocation.changeset(params)
    |> Repo.update()
  end

  def update_shipping_method_zone(%ShippingMethodZone{} = schema, params) do
    schema
    |> ShippingMethodZone.changeset(params)
    |> Repo.update()
  end

  def update_store_payment_method(%StorePaymentMethod{} = schema, params) do
    schema
    |> StorePaymentMethod.changeset(params)
    |> Repo.update()
  end

  def update_variant_option_value(%VariantOptionValue{} = schema, params) do
    schema
    |> VariantOptionValue.changeset(params)
    |> Repo.update()
  end

  def update_zone_member(%ZoneMember{} = schema, params) do
    schema
    |> ZoneMember.changeset(params)
    |> Repo.update()
  end

  # Delete
  def delete_product_option_type(%ProductOptionType{} = schema) do
    ProductOptionType.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_product_property(%ProductProperty{} = schema) do  
    ProductProperty.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_product_taxon(%ProductTaxon{} = schema) do
    ProductTaxon.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_shipping_method_category(%ShippingMethodCategory{} = schema) do
    ShippingMethodCategory.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_shipping_method_stock_location(%ShippingMethodStockLocation{} = schema) do
    ShippingMethodStockLocation.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_shipping_method_zone(%ShippingMethodZone{} = schema) do
    ShippingMethodZone.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_store_payment_method(%StorePaymentMethod{} = schema) do
    StorePaymentMethod.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_variant_option_value(%VariantOptionValue{} = schema) do
    VariantOptionValue.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_zone_member(%ZoneMember{} = schema) do
    ZoneMember.delete_changeset(schema)
    |> Repo.delete()
  end
end