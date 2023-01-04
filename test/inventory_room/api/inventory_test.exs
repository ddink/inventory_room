defmodule InventoryRoom.API.InventoryTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Inventory.StockItem
  import InventoryRoom.API.Inventory

  #####################
  # Inventory Context #
  #####################

  # Create
  describe "create_stock_item/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:stock_item)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StockItem{} = returned_schema} = 
        create_stock_item(params)

      schema_from_db = Repo.get(StockItem, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
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
      bad_params = bad_stock_item_params()

      assert {:error, %Changeset{valid?: false}} = create_stock_item(bad_params)
    end
  end

  # Read
  describe "get_stock_item/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:stock_item)

      assert %StockItem{} = returned_schema = get_stock_item(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert get_stock_item(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_stock_item/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:stock_item)

      params = string_params_for(:stock_item)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %StockItem{} = returned_schema} = update_stock_item(existing_schema, params)

      schema_from_db = Repo.get(StockItem, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
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
      existing_schema = insert(:stock_item)

      bad_params = bad_stock_item_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               update_stock_item(existing_schema, bad_params)

      assert existing_schema == Repo.get(StockItem, existing_schema.id)
    end
  end

  # Delete
  describe "delete_stock_item/1" do
    test "success: it deletes the schema" do
      schema = insert(:stock_item)

      assert {:ok, _deleted_schema} = delete_stock_item(schema)

      refute Repo.get(StockItem, schema.id)
    end
  end
end