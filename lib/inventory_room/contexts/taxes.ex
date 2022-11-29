defmodule InventoryRoom.Contexts.Taxes do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.Taxes.{
    TaxCategory,
    TaxRate
  }

  # Create
  def create_tax_category(params) do
    %TaxCategory{}
    |> TaxCategory.create_changeset(params)
    |> Repo.insert
  end

  def create_tax_rate(params) do
    %TaxRate{}
    |> TaxRate.create_changeset(params)
    |> Repo.insert
  end

  # Read
  def get_tax_category(id), do: Repo.get(TaxCategory, id)

  def get_tax_rate(id), do: Repo.get(TaxRate, id)

  # Update
  def update_tax_category(%TaxCategory{} = schema, params) do
    schema
    |> TaxCategory.changeset(params)
    |> Repo.update
  end

  def update_tax_rate(%TaxRate{} = schema, params) do
    schema
    |> TaxRate.changeset(params)
    |> Repo.update
  end

  # Delete
  def delete_tax_category(%TaxCategory{} = schema) do
    TaxCategory.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_tax_rate(%TaxRate{} = schema) do
    TaxRate.delete_changeset(schema)
    |> Repo.delete
  end
end