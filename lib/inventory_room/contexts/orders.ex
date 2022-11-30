defmodule InventoryRoom.Contexts.Orders do
  alias StoreRepo.Repo
  alias InventoryRoom.Orders.Payment

  # Create
  def create_payment(params) do
    %Payment{}
    |> Payment.create_changeset(params)
    |> Repo.insert
  end

  def create_order(params), do: Orders.create_order(params)

  # Read
  def get_payment(id), do: Repo.get(Payment, id)

  def get_order(id), do: Orders.get_order(id)

	def get_orders_by_user(user), do: Orders.get_by_user(user)

	def get_orders_by_date(date), do: Orders.get_by_date(date)

	def get_orders_by_payment_method(method), do: Orders.get_by_payment_method(method)

	def get_orders_by_payment_country(country_code), do: Orders.get_by_payment_country(country_code)

  # Update
  def update_payment(%Payment{} = schema, params) do
    schema
    |> Payment.changeset(params)
    |> Repo.update
  end

  def update_order(order, attrs), do: Orders.update_order(order, attrs)

  # Delete
  def delete_payment(%Payment{} = schema) do
    Payment.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_order(order), do: Orders.delete_order(order)
end