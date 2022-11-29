defmodule InventoryRoom.Contexts.TaxesTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Taxes
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Settings.Taxes.{
    TaxCategory,
    TaxRate
  }

  describe "create_tax_category/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:tax_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %TaxCategory{} = returned_schema} = 
        Taxes.create_tax_category(params)

      schema_from_db = Repo.get(TaxCategory, returned_schema.id)
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
      bad_params = bad_tax_category_params()

      assert {:error, %Changeset{valid?: false}} = Taxes.create_tax_category(bad_params)
    end
  end

  describe "create_tax_rate/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:tax_rate)
               |> Map.drop(["inserted_at", "updated_at"])

      

      assert {:ok, %TaxRate{} = returned_schema} = 
        Taxes.create_tax_rate(params)

      schema_from_db = Repo.get(TaxRate, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          :deleted_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_tax_rate_params()

      assert {:error, %Changeset{valid?: false}} = Taxes.create_tax_rate(bad_params)
    end
  end

  # Read
  describe "get_tax_category/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:tax_category)

      assert %TaxCategory{} = returned_schema = Taxes.get_tax_category(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Taxes.get_tax_category(Enum.random(1..1000)) == nil
    end
  end

  describe "get_tax_rate/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:tax_rate)

      assert %TaxRate{} = returned_schema = Taxes.get_tax_rate(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Taxes.get_tax_rate(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_tax_category/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:tax_category)

      params = string_params_for(:tax_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %TaxCategory{} = returned_schema} = Taxes.update_tax_category(existing_schema, params)

      schema_from_db = Repo.get(TaxCategory, returned_schema.id)
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
      existing_schema = insert(:tax_category)

      bad_params = bad_tax_category_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Taxes.update_tax_category(existing_schema, bad_params)

      assert existing_schema == Repo.get(TaxCategory, existing_schema.id)
    end
  end

  describe "update_tax_rate/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:tax_rate)

      params = string_params_for(:tax_rate)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %TaxRate{} = returned_schema} = Taxes.update_tax_rate(existing_schema, params)

      schema_from_db = Repo.get(TaxRate, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          :deleted_at ->
            assert expected == actual |> NaiveDateTime.to_string()
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
      existing_schema = insert(:tax_rate)

      bad_params = bad_tax_rate_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Taxes.update_tax_rate(existing_schema, bad_params)

      assert existing_schema == Repo.get(TaxRate, existing_schema.id)
    end
  end

  # Delete
  describe "delete_tax_category/1" do
    test "success: it deletes the schema" do
      schema = insert(:tax_category)

      assert {:ok, _deleted_schema} = Taxes.delete_tax_category(schema)

      refute Repo.get(TaxCategory, schema.id)
    end
  end

  describe "delete_tax_rate/1" do
    test "success: it deletes the schema" do
      schema = insert(:tax_rate)

      assert {:ok, _deleted_schema} = Taxes.delete_tax_rate(schema)

      refute Repo.get(TaxRate, schema.id)
    end
  end
end