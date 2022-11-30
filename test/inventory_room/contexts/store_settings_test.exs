defmodule InventoryRoom.Contexts.StoreSettingsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.StoreSettings
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Settings.{
    PaymentMethod,
    Store
  }

  describe "create_payment_method/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:payment_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PaymentMethod{} = returned_schema} = 
        StoreSettings.create_payment_method(params)

      schema_from_db = Repo.get(PaymentMethod, returned_schema.id)
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
      bad_params = bad_payment_method_params()

      assert {:error, %Changeset{valid?: false}} = StoreSettings.create_payment_method(bad_params)
    end
  end

  describe "create_store/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:store)
               |> Map.drop(["inserted_at", "updated_at"])

      

      assert {:ok, %Store{} = returned_schema} = 
        StoreSettings.create_store(params)

      schema_from_db = Repo.get(Store, returned_schema.id)
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
      bad_params = bad_store_params()

      assert {:error, %Changeset{valid?: false}} = StoreSettings.create_store(bad_params)
    end
  end

  # Read
  describe "get_payment_method/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:payment_method)

      assert %PaymentMethod{} = returned_schema = StoreSettings.get_payment_method(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreSettings.get_payment_method(Enum.random(1..1000)) == nil
    end
  end

  describe "get_store/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:store)

      assert %Store{} = returned_schema = StoreSettings.get_store(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreSettings.get_store(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_payment_method/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:payment_method)

      params = string_params_for(:payment_method)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PaymentMethod{} = returned_schema} = StoreSettings.update_payment_method(existing_schema, params)

      schema_from_db = Repo.get(PaymentMethod, returned_schema.id)
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
      existing_schema = insert(:payment_method)

      bad_params = bad_payment_method_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreSettings.update_payment_method(existing_schema, bad_params)

      assert existing_schema == Repo.get(PaymentMethod, existing_schema.id)
    end
  end

  describe "update_store/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:store)

      params = string_params_for(:store)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Store{} = returned_schema} = StoreSettings.update_store(existing_schema, params)

      schema_from_db = Repo.get(Store, returned_schema.id)
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
      existing_schema = insert(:store)

      bad_params = bad_store_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreSettings.update_store(existing_schema, bad_params)

      assert existing_schema == Repo.get(Store, existing_schema.id)
    end
  end

  # Delete
  describe "delete_payment_method/1" do
    test "success: it deletes the schema" do
      schema = insert(:payment_method)

      assert {:ok, _deleted_schema} = StoreSettings.delete_payment_method(schema)

      refute Repo.get(PaymentMethod, schema.id)
    end
  end

  describe "delete_store/1" do
    test "success: it deletes the schema" do
      schema = insert(:store)

      assert {:ok, _deleted_schema} = StoreSettings.delete_store(schema)

      refute Repo.get(Store, schema.id)
    end
  end
end