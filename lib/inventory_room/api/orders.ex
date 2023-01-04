defmodule InventoryRoom.API.Orders do
  alias InventoryRoom.Contexts.Orders


  ##############
  # Orders API #
  ##############

  # Create
  def create_payment(params), do: Orders.create_payment(params)

  def create_order(params), do: Orders.create_order(params)

  # Read
  def get_payment(id), do: Orders.get_payment(id)

  def get_order(id), do: Orders.get_order(id)

  def get_orders_by_user(user), do: Orders.get_orders_by_user(user)

  def get_orders_by_date(date), do: Orders.get_orders_by_date(date)

  def get_orders_by_payment_method(method), do: Orders.get_orders_by_payment_method(method)

  def get_orders_by_payment_country(country_code), do: Orders.get_orders_by_payment_country(country_code)

  # Update
  def update_payment(payment, params), do: Orders.update_payment(payment, params)

  def update_order(order, params), do: Orders.update_order(order, params)

  # Delete
  def delete_payment(payment), do: Orders.delete_payment(payment)

  def delete_order(order), do: Orders.delete_order(order)
end