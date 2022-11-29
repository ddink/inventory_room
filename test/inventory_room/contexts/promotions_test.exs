defmodule InventoryRoom.Contexts.PromotionsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Promotions
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Promotions.{
    PromotionCategory,
    PromotionCode,
    Promotion
  }
  
  # Create
  describe "create_promotion_category/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:promotion_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PromotionCategory{} = returned_schema} = 
        Promotions.create_promotion_category(params)

      schema_from_db = Repo.get(PromotionCategory, returned_schema.id)
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
      bad_params = bad_promotion_category_params()

      assert {:error, %Changeset{valid?: false}} = Promotions.create_promotion_category(bad_params)
    end
  end

  describe "create_promotion_code/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:promotion_code)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PromotionCode{} = returned_schema} = 
        Promotions.create_promotion_code(params)

      schema_from_db = Repo.get(PromotionCode, returned_schema.id)
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
      bad_params = bad_promotion_code_params()

      assert {:error, %Changeset{valid?: false}} = Promotions.create_promotion_code(bad_params)
    end
  end

  describe "create_promotion/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:promotion)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Promotion{} = returned_schema} = 
        Promotions.create_promotion(params)

      schema_from_db = Repo.get(Promotion, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Promotion.date_fields() do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      for {field, expected} <- params,
            field in Promotion.date_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> NaiveDateTime.to_string()      
      end
      
      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_promotion_params()

      assert {:error, %Changeset{valid?: false}} = Promotions.create_promotion(bad_params)
    end
  end


  # Read
  describe "get_promotion_category/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:promotion_category)

      assert %PromotionCategory{} = returned_schema = Promotions.get_promotion_category(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Promotions.get_promotion_category(Enum.random(1..1000)) == nil
    end
  end

  describe "get_promotion_code/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:promotion_code)

      assert %PromotionCode{} = returned_schema = Promotions.get_promotion_code(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Promotions.get_promotion_code(Enum.random(1..1000)) == nil
    end
  end

  describe "get_promotion/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:promotion)

      assert %Promotion{} = returned_schema = Promotions.get_promotion(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Promotions.get_promotion(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_promotion_category/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:promotion_category)

      params = string_params_for(:promotion_category)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PromotionCategory{} = returned_schema} = Promotions.update_promotion_category(existing_schema, params)

      schema_from_db = Repo.get(PromotionCategory, returned_schema.id)
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
      existing_schema = insert(:promotion_category)

      bad_params = bad_promotion_category_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Promotions.update_promotion_category(existing_schema, bad_params)

      assert existing_schema == Repo.get(PromotionCategory, existing_schema.id)
    end
  end

  describe "update_promotion_code/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:promotion_code)

      params = string_params_for(:promotion_code)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %PromotionCode{} = returned_schema} = Promotions.update_promotion_code(existing_schema, params)

      schema_from_db = Repo.get(PromotionCode, returned_schema.id)
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
      existing_schema = insert(:promotion_code)

      bad_params = bad_promotion_code_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Promotions.update_promotion_code(existing_schema, bad_params)

      assert existing_schema == Repo.get(PromotionCode, existing_schema.id)
    end
  end

  describe "update_promotion/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:promotion)

      params = string_params_for(:promotion)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Promotion{} = returned_schema} = Promotions.update_promotion(existing_schema, params)

      schema_from_db = Repo.get(Promotion, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Promotion.date_fields() do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      for {field, expected} <- params,
            field in Promotion.date_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> NaiveDateTime.to_string()      
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:promotion)

      bad_params = bad_promotion_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Promotions.update_promotion(existing_schema, bad_params)

      assert existing_schema == Repo.get(Promotion, existing_schema.id)
    end
  end

  # Delete
  describe "delete_promotion_category/1" do
    test "success: it deletes the schema" do
      schema = insert(:promotion_category)

      assert {:ok, _deleted_schema} = Promotions.delete_promotion_category(schema)

      refute Repo.get(PromotionCategory, schema.id)
    end
  end

  describe "delete_promotion_code/1" do
    test "success: it deletes the schema" do
      schema = insert(:promotion_code)

      assert {:ok, _deleted_schema} = Promotions.delete_promotion_code(schema)

      refute Repo.get(PromotionCode, schema.id)
    end
  end

  describe "delete_promotion/1" do
    test "success: it deletes the schema" do
      schema = insert(:promotion)

      assert {:ok, _deleted_schema} = Promotions.delete_promotion(schema)

      refute Repo.get(Promotion, schema.id)
    end
  end
end