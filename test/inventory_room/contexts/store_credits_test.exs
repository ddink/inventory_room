defmodule InventoryRoom.Contexts.StoreCreditsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.StoreCredits
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Settings.StoreCredits.{
    CreditCategory,
    CreditReason,
    CreditType,
    Credit
  }

  describe "create_credit_category/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:credit_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CreditCategory{} = returned_schema} = 
        StoreCredits.create_credit_category(params)

      schema_from_db = Repo.get(CreditCategory, returned_schema.id)
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
      bad_params = bad_credit_category_params()

      assert {:error, %Changeset{valid?: false}} = StoreCredits.create_credit_category(bad_params)
    end
  end

  describe "create_credit_reason/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:credit_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      

      assert {:ok, %CreditReason{} = returned_schema} = 
        StoreCredits.create_credit_reason(params)

      schema_from_db = Repo.get(CreditReason, returned_schema.id)
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
      bad_params = bad_credit_reason_params()

      assert {:error, %Changeset{valid?: false}} = StoreCredits.create_credit_reason(bad_params)
    end
  end

  describe "create_credit_type/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:credit_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CreditType{} = returned_schema} = 
        StoreCredits.create_credit_type(params)

      schema_from_db = Repo.get(CreditType, returned_schema.id)
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
      bad_params = bad_credit_type_params()

      assert {:error, %Changeset{valid?: false}} = StoreCredits.create_credit_type(bad_params)
    end
  end

  describe "create_credit/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:credit)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Credit{} = returned_schema} = 
        StoreCredits.create_credit(params)

      schema_from_db = Repo.get(Credit, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Credit.decimal_fields() ++ Credit.naive_datetime_fields() do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      for {field, expected} <- params,
            field in Credit.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      for {field, expected} <- params,
            field in Credit.naive_datetime_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected =~ actual |> NaiveDateTime.to_string()
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_credit_params()

      assert {:error, %Changeset{valid?: false}} = StoreCredits.create_credit(bad_params)
    end
  end

  # Read
  describe "get_credit_category/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:credit_category)

      assert %CreditCategory{} = returned_schema = StoreCredits.get_credit_category(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreCredits.get_credit_category(Enum.random(1..1000)) == nil
    end
  end

  describe "get_credit_reason/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:credit_reason)

      assert %CreditReason{} = returned_schema = StoreCredits.get_credit_reason(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreCredits.get_credit_reason(Enum.random(1..1000)) == nil
    end
  end

  describe "get_credit_type/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:credit_type)

      assert %CreditType{} = returned_schema = StoreCredits.get_credit_type(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreCredits.get_credit_type(Enum.random(1..1000)) == nil
    end
  end

  describe "get_credit/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:credit)

      assert %Credit{} = returned_schema = StoreCredits.get_credit(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert StoreCredits.get_credit(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_credit_category/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:credit_category)

      params = string_params_for(:credit_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CreditCategory{} = returned_schema} = StoreCredits.update_credit_category(existing_schema, params)

      schema_from_db = Repo.get(CreditCategory, returned_schema.id)
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
      existing_schema = insert(:credit_category)

      bad_params = bad_credit_category_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreCredits.update_credit_category(existing_schema, bad_params)

      assert existing_schema == Repo.get(CreditCategory, existing_schema.id)
    end
  end

  describe "update_credit_reason/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:credit_reason)

      params = string_params_for(:credit_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CreditReason{} = returned_schema} = StoreCredits.update_credit_reason(existing_schema, params)

      schema_from_db = Repo.get(CreditReason, returned_schema.id)
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
      existing_schema = insert(:credit_reason)

      bad_params = bad_credit_reason_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreCredits.update_credit_reason(existing_schema, bad_params)

      assert existing_schema == Repo.get(CreditReason, existing_schema.id)
    end
  end

  describe "update_credit_type/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:credit_type)

      params = string_params_for(:credit_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CreditType{} = returned_schema} = StoreCredits.update_credit_type(existing_schema, params)

      schema_from_db = Repo.get(CreditType, returned_schema.id)
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
      existing_schema = insert(:credit_type)

      bad_params = bad_credit_type_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreCredits.update_credit_type(existing_schema, bad_params)

      assert existing_schema == Repo.get(CreditType, existing_schema.id)
    end
  end

  describe "update_credit/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:credit)

      params = string_params_for(:credit)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Credit{} = returned_schema} = StoreCredits.update_credit(existing_schema, params)

      schema_from_db = Repo.get(Credit, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Credit.decimal_fields() ++ Credit.naive_datetime_fields() do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      for {field, expected} <- params,
            field in Credit.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      for {field, expected} <- params,
            field in Credit.naive_datetime_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected =~ actual |> NaiveDateTime.to_string()
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:credit)

      bad_params = bad_credit_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               StoreCredits.update_credit(existing_schema, bad_params)

      assert existing_schema == Repo.get(Credit, existing_schema.id)
    end
  end

  # Delete
  describe "delete_credit_category/1" do
    test "success: it deletes the schema" do
      schema = insert(:credit_category)

      assert {:ok, _deleted_schema} = StoreCredits.delete_credit_category(schema)

      refute Repo.get(CreditCategory, schema.id)
    end
  end

  describe "delete_credit_reason/1" do
    test "success: it deletes the schema" do
      schema = insert(:credit_reason)

      assert {:ok, _deleted_schema} = StoreCredits.delete_credit_reason(schema)

      refute Repo.get(CreditReason, schema.id)
    end
  end

  describe "delete_credit_type/1" do
    test "success: it deletes the schema" do
      schema = insert(:credit_type)

      assert {:ok, _deleted_schema} = StoreCredits.delete_credit_type(schema)

      refute Repo.get(CreditType, schema.id)
    end
  end

  describe "delete_credit/1" do
    test "success: it deletes the schema" do
      schema = insert(:credit)

      assert {:ok, _deleted_schema} = StoreCredits.delete_credit(schema)

      refute Repo.get(Credit, schema.id)
    end
  end
end