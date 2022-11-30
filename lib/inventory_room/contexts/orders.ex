defmodule InventoryRoom.Contexts.Orders do
  alias StoreRepo.Repo
  alias InventoryRoom.Orders.Payment

  def create_payment(params) do
    %Payment{}
    |> Payment.create_changeset(params)
    |> Repo.insert
  end

  def get_payment(id), do: Repo.get(Payment, id)

  def update_payment(%Payment{} = schema, params) do
    schema
    |> Payment.changeset(params)
    |> Repo.update
  end

  def delete_payment(%Payment{} = schema) do
    Payment.delete_changeset(schema)
    |> Repo.delete
  end
end