defmodule InventoryRoom.Contexts.StoreSettings do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.{
    PaymentMethod,
    Store
  }

  # Create
  def create_payment_method(params) do
    %PaymentMethod{}
    |> PaymentMethod.create_changeset(params)
    |> Repo.insert
  end

  def create_store(params) do
    %Store{}
    |> Store.create_changeset(params)
    |> Repo.insert
  end

  # Read
  def get_payment_method(id), do: Repo.get(PaymentMethod, id)

  def get_store(id), do: Repo.get(Store, id)

  # Update
  def update_payment_method(%PaymentMethod{} = schema, params) do
    schema
    |> PaymentMethod.changeset(params)
    |> Repo.update
  end

  def update_store(%Store{} = schema, params) do
    schema
    |> Store.changeset(params)
    |> Repo.update
  end

  # Delete
  def delete_payment_method(%PaymentMethod{} = schema) do
    PaymentMethod.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_store(%Store{} = schema) do
    Store.delete_changeset(schema)
    |> Repo.delete
  end
end