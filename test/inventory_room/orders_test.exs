defmodule InventoryRoom.OrdersTest do
	use InventoryRoom.DataCase, async: true
	alias ShoppingCart.Schemas.Cart
	alias StoreRepo.Repo
	import ShoppingCart.Query
	import InventoryRoom.Orders
	alias ShoppingCart.Factory

	describe "get_orders_by_user/1" do
		test "success: it returns all orders when given a user" do
			user = Factory.insert(:user)
      cart1 = Factory.insert(:cart)
      cart2 = Factory.insert(:cart)
      cart3 = Factory.insert(:cart)

      update_cart_user_id(cart1, user)
      update_cart_user_id(cart2, user)
      update_cart_user_id(cart3, user)

      cart1 = Repo.get(cart_with_order(), cart1.id)
      cart2 = Repo.get(cart_with_order(), cart2.id)
      cart3 = Repo.get(cart_with_order(), cart3.id)

      assert cart1.user_id == user.id
      assert cart2.user_id == user.id
      assert cart3.user_id == user.id

      assert Enum.sort(get_orders_by_user(user)) == Enum.sort([cart1.order, cart2.order, cart3.order])
		end

		test "error: it returns nil when there are no orders associated with a user" do
      user = Factory.insert(:user)

      assert get_orders_by_user(user) == nil
    end
	end

  defp update_cart_user_id(cart, user) do
    changeset = Cart.changeset(cart, %{user_id: user.id})
    Repo.update(changeset)
  end

	describe "get_orders_by_date/1" do
		test "success: it returns all orders with matching inserted_at value when given a naive datetime" do
			order1 = Factory.insert(:order)
			order2 = Factory.insert(:order)
			
			assert get_orders_by_date(NaiveDateTime.utc_now()) == [order1, order2]
		end

		test "error: it returns nil when there are no orders with a matching inserted_at value" do
			order1 = Factory.insert(:order)
			order2 = Factory.insert(:order)
			datetime = NaiveDateTime.new!(2021, 1, 1, 0, 0, 0)
			
			assert get_orders_by_date(datetime) == nil
			refute get_orders_by_date(datetime) == [order1, order2]
		end
	end

	describe "get_orders_by_payment_method/1" do
    test "success: it returns all orders with a payment_method value that matches the given payment method" do
      order1 = Factory.insert(:static_value_order)
      order2 = Factory.insert(:static_value_order)
      order3 = Factory.insert(:static_value_order)

      assert get_orders_by_payment_method(order1.payment_method) == [order1, order2, order3]
    end

    test "error: it returns nil where there are no orders witih a matching payment_method value" do
      Factory.insert(:static_value_order)
      Factory.insert(:static_value_order)
      Factory.insert(:static_value_order)

      assert get_orders_by_payment_method("EFECTY") == nil
    end
  end

  describe "get_orders_by_payment_country/1" do
    test "success: it returns all orders with a payment_country value that matches the given country code" do
      # dbg(Repo.all(Orders.Order))
			
			order1 = Factory.insert(:static_value_order)
      order2 = Factory.insert(:static_value_order)
      order3 = Factory.insert(:static_value_order)

			# dbg(Repo.all(Orders.Order))
			# dbg(get_orders_by_payment_country(order1.payment_country))

      assert get_orders_by_payment_country(order1.payment_country) == [order1, order2, order3]
    end

    test "error: it returns nil where there are no orders witih a matching payment_country value" do
      Factory.insert(:static_value_order)
      Factory.insert(:static_value_order)
      Factory.insert(:static_value_order)

      assert get_orders_by_payment_country("US") == nil
    end
  end
end