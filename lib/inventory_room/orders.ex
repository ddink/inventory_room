defmodule InventoryRoom.Orders do
	def create_order(params), do: Orders.create_order(params)

	def get_order(id), do: Orders.get_order(id)

	def get_orders_by_user(user), do: Orders.get_by_user(user)

	def get_orders_by_date(date), do: Orders.get_by_date(date)

	def get_orders_by_payment_method(method), do: Orders.get_by_payment_method(method)

	def get_orders_by_payment_country(country_code), do: Orders.get_by_payment_country(country_code)

	def update_order(order, attrs), do: Orders.update_order(order, attrs)

	def delete_order(order), do: Orders.delete_order(order)
end