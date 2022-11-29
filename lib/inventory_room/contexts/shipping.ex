defmodule InventoryRoom.Contexts.Shipping do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.Shipping.{
    Shipment,
    ShippingCategory,
    ShippingMethod,
    StockLocation
  }

  # Create
  def create_shipment(params) do
    %Shipment{}
    |> Shipment.create_changeset(params)
    |> Repo.insert()
  end

  def create_shipping_category(params) do
    %ShippingCategory{}
    |> ShippingCategory.create_changeset(params)
    |> Repo.insert()
  end

  def create_shipping_method(params) do
    %ShippingMethod{}
    |> ShippingMethod.create_changeset(params)
    |> Repo.insert()
  end

  def create_stock_location(params) do
    %StockLocation{}
    |> StockLocation.create_changeset(params)
    |> Repo.insert()
  end

  # Read
  def get_shipment(id), do: Repo.get(Shipment, id)

  def get_shipping_category(id), do: Repo.get(ShippingCategory, id)

  def get_shipping_method(id), do: Repo.get(ShippingMethod, id)

  def get_stock_location(id), do: Repo.get(StockLocation, id)

  # Update
  def update_shipment(%Shipment{} = schema, params) do
    schema
    |> Shipment.changeset(params)
    |> Repo.update()
  end

  def update_shipping_category(%ShippingCategory{} = schema, params) do
    schema
    |> ShippingCategory.changeset(params)
    |> Repo.update()
  end

  def update_shipping_method(%ShippingMethod{} = schema, params) do
    schema
    |> ShippingMethod.changeset(params)
    |> Repo.update()
  end

  def update_stock_location(%StockLocation{} = schema, params) do
    schema
    |> StockLocation.changeset(params)
    |> Repo.update()
  end

  # Delete
  def delete_shipment(%Shipment{} = schema) do
    Shipment.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_shipping_category(%ShippingCategory{} = schema) do
    ShippingCategory.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_shipping_method(%ShippingMethod{} = schema) do
    ShippingMethod.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_stock_location(%StockLocation{} = schema) do
    StockLocation.delete_changeset(schema)
    |> Repo.delete()
  end
end