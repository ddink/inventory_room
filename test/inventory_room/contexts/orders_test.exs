defmodule InventoryRoom.Contexts.OrdersTest do
  use InventoryRoom.DataCase, async: true
  alias ShoppingCart.Schemas.Cart
  alias Ecto.Changeset
	import InventoryRoom.Contexts.Orders
  alias InventoryRoom.Orders.Payment
  import InventoryRoom.Factory
  import ShoppingCart.Query
	alias StoreRepo.Repo

  # Create
  describe "create_payment/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:payment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Payment{} = returned_schema} = 
        create_payment(params)

      schema_from_db = Repo.get(Payment, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_payment_params()

      assert {:error, %Changeset{valid?: false}} = create_payment(bad_params)
    end
  end

  # Read
  describe "get_payment/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:payment)

      assert %Payment{} = returned_schema = get_payment(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert get_payment(Enum.random(1..1000)) == nil
    end
  end

  describe "get_orders_by_user/1" do
		test "success: it returns all orders when given a user" do
			user = ShoppingCart.Factory.insert(:user)
      cart1 = ShoppingCart.Factory.insert(:cart)
      cart2 = ShoppingCart.Factory.insert(:cart)
      cart3 = ShoppingCart.Factory.insert(:cart)

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
      user = ShoppingCart.Factory.insert(:user)

      assert get_orders_by_user(user) == nil
    end
	end

  defp update_cart_user_id(cart, user) do
    changeset = Cart.changeset(cart, %{user_id: user.id})
    Repo.update(changeset)
  end

	describe "get_orders_by_date/1" do
		test "success: it returns all orders with matching inserted_at value when given a naive datetime" do
			order1 = ShoppingCart.Factory.insert(:order)
			order2 = ShoppingCart.Factory.insert(:order)
			
			assert get_orders_by_date(NaiveDateTime.utc_now()) == [order1, order2]
		end

		test "error: it returns nil when there are no orders with a matching inserted_at value" do
			order1 = ShoppingCart.Factory.insert(:order)
			order2 = ShoppingCart.Factory.insert(:order)
			datetime = NaiveDateTime.new!(2021, 1, 1, 0, 0, 0)
			
			assert get_orders_by_date(datetime) == nil
			refute get_orders_by_date(datetime) == [order1, order2]
		end
	end

	describe "get_orders_by_payment_method/1" do
    test "success: it returns all orders with a payment_method value that matches the given payment method" do
      order1 = ShoppingCart.Factory.insert(:static_value_order)
      order2 = ShoppingCart.Factory.insert(:static_value_order)
      order3 = ShoppingCart.Factory.insert(:static_value_order)

      assert get_orders_by_payment_method(order1.payment_method) == [order1, order2, order3]
    end

    test "error: it returns nil where there are no orders witih a matching payment_method value" do
      ShoppingCart.Factory.insert(:static_value_order)
      ShoppingCart.Factory.insert(:static_value_order)
      ShoppingCart.Factory.insert(:static_value_order)

      assert get_orders_by_payment_method("EFECTY") == nil
    end
  end

  describe "get_orders_by_payment_country/1" do
    test "success: it returns all orders with a payment_country value that matches the given country code" do
      order1 = ShoppingCart.Factory.insert(:static_value_order)
      order2 = ShoppingCart.Factory.insert(:static_value_order)
      order3 = ShoppingCart.Factory.insert(:static_value_order)

      assert get_orders_by_payment_country(order1.payment_country) == [order1, order2, order3]
    end

    test "error: it returns nil where there are no orders witih a matching payment_country value" do
      ShoppingCart.Factory.insert(:static_value_order)
      ShoppingCart.Factory.insert(:static_value_order)
      ShoppingCart.Factory.insert(:static_value_order)

      assert get_orders_by_payment_country("US") == nil
    end
  end

  # Update
  describe "update_payment/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:payment)

      params = string_params_for(:payment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Payment{} = returned_schema} = update_payment(existing_schema, params)

      schema_from_db = Repo.get(Payment, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:payment)

      bad_params = bad_payment_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               update_payment(existing_schema, bad_params)

      assert existing_schema == Repo.get(Payment, existing_schema.id)
    end
  end

  # Delete
  describe "delete_payment/1" do
    test "success: it deletes the schema" do
      schema = insert(:payment)

      assert {:ok, _deleted_schema} = delete_payment(schema)

      refute Repo.get(Payment, schema.id)
    end
  end
end