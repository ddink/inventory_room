defmodule InventoryRoom.Contexts.ShippingTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Shipping
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Settings.Shipping.{
    Shipment,
    ShippingCategory,
    ShippingMethod,
    StockLocation
  }

  describe "create_shipment/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Shipment{} = returned_schema} = 
        Shipping.create_shipment(params)

      schema_from_db = Repo.get(Shipment, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Shipment.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        case field do
          :shipped_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      for {field, expected} <- params,
            field in Shipment.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_shipment_params()

      assert {:error, %Changeset{valid?: false}} = Shipping.create_shipment(bad_params)
    end
  end

  describe "create_shipping_category/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipping_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingCategory{} = returned_schema} = 
        Shipping.create_shipping_category(params)

      schema_from_db = Repo.get(ShippingCategory, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_shipping_category_params()

      assert {:error, %Changeset{valid?: false}} = Shipping.create_shipping_category(bad_params)
    end
  end

  describe "create_shipping_method/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipping_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethod{} = returned_schema} = 
        Shipping.create_shipping_method(params)

      schema_from_db = Repo.get(ShippingMethod, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :deleted_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end
      
      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_shipping_method_params()

      assert {:error, %Changeset{valid?: false}} = Shipping.create_shipping_method(bad_params)
    end
  end

  describe "create_stock_location/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:stock_location)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StockLocation{} = returned_schema} = 
        Shipping.create_stock_location(params)

      schema_from_db = Repo.get(StockLocation, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_stock_location_params()

      assert {:error, %Changeset{valid?: false}} = Shipping.create_stock_location(bad_params)
    end
  end

  # Read
  describe "get_shipment/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipment)

      assert %Shipment{} = returned_schema = Shipping.get_shipment(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Shipping.get_shipment(Enum.random(1..1000)) == nil
    end
  end

  describe "get_shipping_category/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipping_category)

      assert %ShippingCategory{} = returned_schema = Shipping.get_shipping_category(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Shipping.get_shipping_category(Enum.random(1..1000)) == nil
    end
  end

  describe "get_shipping_method/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipping_method)

      assert %ShippingMethod{} = returned_schema = Shipping.get_shipping_method(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Shipping.get_shipping_method(Enum.random(1..1000)) == nil
    end
  end

  describe "get_stock_location/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:stock_location)

      assert %StockLocation{} = returned_schema = Shipping.get_stock_location(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Shipping.get_stock_location(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_shipment/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipment)

      params = string_params_for(:shipment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Shipment{} = returned_schema} = Shipping.update_shipment(existing_schema, params)

      schema_from_db = Repo.get(Shipment, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Shipment.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        case field do
          :shipped_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      for {field, expected} <- params,
            field in Shipment.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:shipment)

      bad_params = bad_shipment_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Shipping.update_shipment(existing_schema, bad_params)

      assert existing_schema == Repo.get(Shipment, existing_schema.id)
    end
  end

  describe "update_shipping_category/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipping_category)

      params = string_params_for(:shipping_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingCategory{} = returned_schema} = Shipping.update_shipping_category(existing_schema, params)

      schema_from_db = Repo.get(ShippingCategory, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
               "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:shipping_category)

      bad_params = bad_shipping_category_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Shipping.update_shipping_category(existing_schema, bad_params)

      assert existing_schema == Repo.get(ShippingCategory, existing_schema.id)
    end
  end

  describe "update_shipping_method/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipping_method)

      params = string_params_for(:shipping_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethod{} = returned_schema} = Shipping.update_shipping_method(existing_schema, params)

      schema_from_db = Repo.get(ShippingMethod, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :deleted_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
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
      existing_schema = insert(:shipping_method)

      bad_params = bad_shipping_method_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Shipping.update_shipping_method(existing_schema, bad_params)

      assert existing_schema == Repo.get(ShippingMethod, existing_schema.id)
    end
  end

  describe "update_stock_location/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:stock_location)

      params = string_params_for(:stock_location)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StockLocation{} = returned_schema} = Shipping.update_stock_location(existing_schema, params)

      schema_from_db = Repo.get(StockLocation, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:stock_location)

      bad_params = bad_stock_location_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Shipping.update_stock_location(existing_schema, bad_params)

      assert existing_schema == Repo.get(StockLocation, existing_schema.id)
    end
  end

  # Delete
  describe "delete_shipment/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipment)

      assert {:ok, _deleted_schema} = Shipping.delete_shipment(schema)

      refute Repo.get(Shipment, schema.id)
    end
  end

  describe "delete_shipping_category/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipping_category)

      assert {:ok, _deleted_schema} = Shipping.delete_shipping_category(schema)

      refute Repo.get(ShippingCategory, schema.id)
    end
  end

  describe "delete_shipping_method/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipping_method)

      assert {:ok, _deleted_schema} = Shipping.delete_shipping_method(schema)

      refute Repo.get(ShippingMethod, schema.id)
    end
  end

  describe "delete_stock_location/1" do
    test "success: it deletes the schema" do
      schema = insert(:stock_location)

      assert {:ok, _deleted_schema} = Shipping.delete_stock_location(schema)

      refute Repo.get(StockLocation, schema.id)
    end
  end
end