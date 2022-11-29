defmodule InventoryRoom.Contexts.StoreCredits do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.StoreCredits.{
    CreditCategory,
    CreditReason,
    CreditType,
    Credit
  }

  # Create
  def create_credit_category(params) do
    %CreditCategory{}
    |> CreditCategory.create_changeset(params)
    |> Repo.insert
  end

  def create_credit_reason(params) do
    %CreditReason{}
    |> CreditReason.create_changeset(params)
    |> Repo.insert
  end

  def create_credit_type(params) do
    %CreditType{}
    |> CreditType.create_changeset(params)
    |> Repo.insert
  end

  def create_credit(params) do
    %Credit{}
    |> Credit.create_changeset(params)
    |> Repo.insert
  end

  # Read
  def get_credit_category(id), do: Repo.get(CreditCategory, id)

  def get_credit_reason(id), do: Repo.get(CreditReason, id)

  def get_credit_type(id), do: Repo.get(CreditType, id)

  def get_credit(id), do: Repo.get(Credit, id)

  # Update
  def update_credit_category(%CreditCategory{} = schema, params) do
    schema
    |> CreditCategory.changeset(params)
    |> Repo.update
  end

  def update_credit_reason(%CreditReason{} = schema, params) do
    schema
    |> CreditReason.changeset(params)
    |> Repo.update
  end

  def update_credit_type(%CreditType{} = schema, params) do
    schema
    |> CreditType.changeset(params)
    |> Repo.update
  end

  def update_credit(%Credit{} = schema, params) do
    schema
    |> Credit.changeset(params)
    |> Repo.update
  end

  # Delete
  def delete_credit_category(%CreditCategory{} = schema) do
    CreditCategory.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_credit_reason(%CreditReason{} = schema) do
    CreditReason.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_credit_type(%CreditType{} = schema) do
    CreditType.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_credit(%Credit{} = schema) do
    Credit.delete_changeset(schema)
    |> Repo.delete
  end
end