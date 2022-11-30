defmodule InventoryRoom.Contexts.OrdersTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Orders
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Orders.Payment

  describe "create_payment/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:payment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Payment{} = returned_schema} = 
        Orders.create_payment(params)

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

      assert {:error, %Changeset{valid?: false}} = Orders.create_payment(bad_params)
    end
  end

  # Read
  describe "get_payment/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:payment)

      assert %Payment{} = returned_schema = Orders.get_payment(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Orders.get_payment(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_payment/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:payment)

      params = string_params_for(:payment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Payment{} = returned_schema} = Orders.update_payment(existing_schema, params)

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
               Orders.update_payment(existing_schema, bad_params)

      assert existing_schema == Repo.get(Payment, existing_schema.id)
    end
  end

  # Delete
  describe "delete_payment/1" do
    test "success: it deletes the schema" do
      schema = insert(:payment)

      assert {:ok, _deleted_schema} = Orders.delete_payment(schema)

      refute Repo.get(Payment, schema.id)
    end
  end
end