defmodule InventoryRoom.Contexts.JoinsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Joins
  import InventoryRoom.Factory
	alias StoreRepo.Repo

  alias InventoryRoom.Joins.{
    ProductOptionType,
    ProductProperty,
    ProductTaxon,
    ShippingMethodCategory,
    ShippingMethodStockLocation,
    ShippingMethodZone,
    StorePaymentMethod,
    VariantOptionValue,
    ZoneMember
  }

  # Create
  describe "create_product_option_type/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:product_option_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductOptionType{} = returned_schema} = 
        Joins.create_product_option_type(params)

      schema_from_db = Repo.get(ProductOptionType, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_product_option_type(bad_params)
    end
  end

  describe "create_product_property/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:product_property)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductProperty{} = returned_schema} = 
        Joins.create_product_property(params)

      schema_from_db = Repo.get(ProductProperty, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_product_property(bad_params)
    end
  end

  describe "create_product_taxon/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:product_taxon)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductTaxon{} = returned_schema} = 
        Joins.create_product_taxon(params)

      schema_from_db = Repo.get(ProductTaxon, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_product_taxon(bad_params)
    end
  end

  describe "create_shipping_method_category/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipping_method_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodCategory{} = returned_schema} = 
        Joins.create_shipping_method_category(params)

      schema_from_db = Repo.get(ShippingMethodCategory, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_shipping_method_category(bad_params)
    end
  end

  describe "create_shipping_method_stock_location/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipping_method_stock_location)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodStockLocation{} = returned_schema} = 
        Joins.create_shipping_method_stock_location(params)

      schema_from_db = Repo.get(ShippingMethodStockLocation, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_shipping_method_stock_location(bad_params)
    end
  end

  describe "create_shipping_method_zone/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:shipping_method_zone)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodZone{} = returned_schema} = 
        Joins.create_shipping_method_zone(params)

      schema_from_db = Repo.get(ShippingMethodZone, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_shipping_method_zone(bad_params)
    end
  end

  describe "create_store_payment_method/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:store_payment_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StorePaymentMethod{} = returned_schema} = 
        Joins.create_store_payment_method(params)

      schema_from_db = Repo.get(StorePaymentMethod, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_store_payment_method(bad_params)
    end
  end

  describe "create_variant_option_value/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:variant_option_value)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %VariantOptionValue{} = returned_schema} = 
        Joins.create_variant_option_value(params)

      schema_from_db = Repo.get(VariantOptionValue, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_variant_option_value(bad_params)
    end
  end

  describe "create_zone_member/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:zone_member)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ZoneMember{} = returned_schema} = 
        Joins.create_zone_member(params)

      schema_from_db = Repo.get(ZoneMember, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(schema_from_db, schema_field)

        assert actual == expected,
          "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = %{}

      assert {:error, %Changeset{valid?: false}} = Joins.create_zone_member(bad_params)
    end
  end

  # Read
  describe "get_product_option_type/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:product_option_type)

      assert %ProductOptionType{} = returned_schema = Joins.get_product_option_type(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_product_option_type(Enum.random(1..1000)) == nil
    end
  end

  describe "get_product_property/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:product_property)

      assert %ProductProperty{} = returned_schema = Joins.get_product_property(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_product_property(Enum.random(1..1000)) == nil
    end
  end

  describe "get_product_taxon/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:product_taxon)

      assert %ProductTaxon{} = returned_schema = Joins.get_product_taxon(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_product_taxon(Enum.random(1..1000)) == nil
    end
  end

  describe "get_shipping_method_category/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipping_method_category)

      assert %ShippingMethodCategory{} = returned_schema = Joins.get_shipping_method_category(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_shipping_method_category(Enum.random(1..1000)) == nil
    end
  end

  describe "get_shipping_method_stock_location/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipping_method_stock_location)

      assert %ShippingMethodStockLocation{} = returned_schema = Joins.get_shipping_method_stock_location(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_shipping_method_stock_location(Enum.random(1..1000)) == nil
    end
  end

  describe "get_shipping_method_zone/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:shipping_method_zone)

      assert %ShippingMethodZone{} = returned_schema = Joins.get_shipping_method_zone(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_shipping_method_zone(Enum.random(1..1000)) == nil
    end
  end
  
  describe "get_store_payment_method/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:store_payment_method)

      assert %StorePaymentMethod{} = returned_schema = Joins.get_store_payment_method(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_store_payment_method(Enum.random(1..1000)) == nil
    end
  end

  describe "get_variant_option_value/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:variant_option_value)

      assert %VariantOptionValue{} = returned_schema = Joins.get_variant_option_value(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_variant_option_value(Enum.random(1..1000)) == nil
    end
  end

  describe "get_zone_member/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:zone_member)

      assert %ZoneMember{} = returned_schema = Joins.get_zone_member(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Joins.get_zone_member(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_product_option_type/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:product_option_type)

      params = string_params_for(:product_option_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductOptionType{} = returned_schema} = Joins.update_product_option_type(existing_schema, params)

      schema_from_db = Repo.get(ProductOptionType, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:product_option_type)

      bad_params = bad_product_option_type_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_product_option_type(existing_schema, bad_params)

      assert existing_schema == Repo.get(ProductOptionType, existing_schema.id)
    end
  end

  describe "update_product_property/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:product_property)

      params = string_params_for(:product_property)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductProperty{} = returned_schema} = Joins.update_product_property(existing_schema, params)

      schema_from_db = Repo.get(ProductProperty, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:product_property)

      bad_params = bad_product_property_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_product_property(existing_schema, bad_params)

      assert existing_schema == Repo.get(ProductProperty, existing_schema.id)
    end
  end

  describe "update_product_taxon/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:product_taxon)

      params = string_params_for(:product_taxon)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductTaxon{} = returned_schema} = Joins.update_product_taxon(existing_schema, params)

      schema_from_db = Repo.get(ProductTaxon, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:product_taxon)

      bad_params = bad_product_taxon_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_product_taxon(existing_schema, bad_params)

      assert existing_schema == Repo.get(ProductTaxon, existing_schema.id)
    end
  end

  describe "update_shipping_method_category/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipping_method_category)

      params = string_params_for(:shipping_method_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodCategory{} = returned_schema} = Joins.update_shipping_method_category(existing_schema, params)

      schema_from_db = Repo.get(ShippingMethodCategory, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:shipping_method_category)

      bad_params = bad_shipping_method_category_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_shipping_method_category(existing_schema, bad_params)

      assert existing_schema == Repo.get(ShippingMethodCategory, existing_schema.id)
    end
  end

  describe "update_shipping_method_stock_location/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipping_method_stock_location)

      params = string_params_for(:shipping_method_stock_location)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodStockLocation{} = returned_schema} = Joins.update_shipping_method_stock_location(existing_schema, params)

      schema_from_db = Repo.get(ShippingMethodStockLocation, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:shipping_method_stock_location)

      bad_params = bad_shipping_method_stock_location_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_shipping_method_stock_location(existing_schema, bad_params)

      assert existing_schema == Repo.get(ShippingMethodStockLocation, existing_schema.id)
    end
  end

  describe "update_shipping_method_zone/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:shipping_method_zone)

      params = string_params_for(:shipping_method_zone)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ShippingMethodZone{} = returned_schema} = Joins.update_shipping_method_zone(existing_schema, params)

      schema_from_db = Repo.get(ShippingMethodZone, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:shipping_method_zone)

      bad_params = bad_shipping_method_zone_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_shipping_method_zone(existing_schema, bad_params)

      assert existing_schema == Repo.get(ShippingMethodZone, existing_schema.id)
    end
  end

  describe "update_store_payment_method/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:store_payment_method)

      params = string_params_for(:store_payment_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StorePaymentMethod{} = returned_schema} = Joins.update_store_payment_method(existing_schema, params)

      schema_from_db = Repo.get(StorePaymentMethod, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:store_payment_method)

      bad_params = bad_store_payment_method_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_store_payment_method(existing_schema, bad_params)

      assert existing_schema == Repo.get(StorePaymentMethod, existing_schema.id)
    end
  end

  describe "update_variant_option_value/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:variant_option_value)

      params = string_params_for(:variant_option_value)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %VariantOptionValue{} = returned_schema} = Joins.update_variant_option_value(existing_schema, params)

      schema_from_db = Repo.get(VariantOptionValue, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:variant_option_value)

      bad_params = bad_variant_option_value_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_variant_option_value(existing_schema, bad_params)

      assert existing_schema == Repo.get(VariantOptionValue, existing_schema.id)
    end
  end

  describe "update_zone_member/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:zone_member)

      params = string_params_for(:zone_member)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ZoneMember{} = returned_schema} = Joins.update_zone_member(existing_schema, params)

      schema_from_db = Repo.get(ZoneMember, returned_schema.id)
      assert returned_schema == schema_from_db

      for {param_field, expected} <- params do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(returned_schema, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:zone_member)

      bad_params = bad_zone_member_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Joins.update_zone_member(existing_schema, bad_params)

      assert existing_schema == Repo.get(ZoneMember, existing_schema.id)
    end
  end

  # Delete
  describe "delete_product_option_type/1" do
    test "success: it deletes the schema" do
      schema = insert(:product_option_type)

      assert {:ok, _deleted_schema} = Joins.delete_product_option_type(schema)

      refute Repo.get(ProductOptionType, schema.id)
    end
  end

  describe "delete_product_property/1" do
    test "success: it deletes the schema" do
      schema = insert(:product_property)

      assert {:ok, _deleted_schema} = Joins.delete_product_property(schema)

      refute Repo.get(ProductProperty, schema.id)
    end
  end

  describe "delete_product_taxon/1" do
    test "success: it deletes the schema" do
      schema = insert(:product_taxon)

      assert {:ok, _deleted_schema} = Joins.delete_product_taxon(schema)

      refute Repo.get(ProductTaxon, schema.id)
    end
  end

  describe "delete_shipping_method_category/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipping_method_category)

      assert {:ok, _deleted_schema} = Joins.delete_shipping_method_category(schema)

      refute Repo.get(ShippingMethodCategory, schema.id)
    end
  end

  describe "delete_shipping_method_stock_location/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipping_method_stock_location)

      assert {:ok, _deleted_schema} = Joins.delete_shipping_method_stock_location(schema)

      refute Repo.get(ShippingMethodStockLocation, schema.id)
    end
  end

  describe "delete_shipping_method_zone/1" do
    test "success: it deletes the schema" do
      schema = insert(:shipping_method_zone)

      assert {:ok, _deleted_schema} = Joins.delete_shipping_method_zone(schema)

      refute Repo.get(ShippingMethodZone, schema.id)
    end
  end

  describe "delete_store_payment_method/1" do
    test "success: it deletes the schema" do
      schema = insert(:store_payment_method)

      assert {:ok, _deleted_schema} = Joins.delete_store_payment_method(schema)

      refute Repo.get(StorePaymentMethod, schema.id)
    end
  end

  describe "delete_variant_option_value/1" do
    test "success: it deletes the schema" do
      schema = insert(:variant_option_value)

      assert {:ok, _deleted_schema} = Joins.delete_variant_option_value(schema)

      refute Repo.get(VariantOptionValue, schema.id)
    end
  end

  describe "delete_zone_member/1" do
    test "success: it deletes the schema" do
      schema = insert(:zone_member)

      assert {:ok, _deleted_schema} = Joins.delete_zone_member(schema)

      refute Repo.get(ZoneMember, schema.id)
    end
  end
end