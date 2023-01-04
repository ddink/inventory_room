defmodule InventoryRoom.API.ZonesTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Factory
  import InventoryRoom.API.Zones
	alias StoreRepo.Repo

  alias InventoryRoom.Settings.Zones.{
    Country,
    State,
    Zone
  }

  #############
  # Zones API #
  #############

  describe "create_country/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:country)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Country{} = returned_schema} = 
        create_country(params)

      schema_from_db = Repo.get(Country, returned_schema.id)
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
      bad_params = bad_country_params()

      assert {:error, %Changeset{valid?: false}} = create_country(bad_params)
    end
  end

  describe "create_state/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:state)
               |> Map.drop(["inserted_at", "updated_at"])

      

      assert {:ok, %State{} = returned_schema} = 
        create_state(params)

      schema_from_db = Repo.get(State, returned_schema.id)
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
      bad_params = bad_state_params()

      assert {:error, %Changeset{valid?: false}} = create_state(bad_params)
    end
  end

  describe "create_zone/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:zone)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Zone{} = returned_schema} = 
        create_zone(params)

      schema_from_db = Repo.get(Zone, returned_schema.id)
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
      bad_params = bad_zone_params()

      assert {:error, %Changeset{valid?: false}} = create_zone(bad_params)
    end
  end

  # Read
  describe "get_country/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:country)

      assert %Country{} = returned_schema = get_country(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert get_country(Enum.random(1..1000)) == nil
    end
  end

  describe "get_state/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:state)

      assert %State{} = returned_schema = get_state(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert get_state(Enum.random(1..1000)) == nil
    end
  end

  describe "get_zone/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:zone)

      assert %Zone{} = returned_schema = get_zone(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert get_zone(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_country/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:country)

      params = string_params_for(:country)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Country{} = returned_schema} = update_country(existing_schema, params)

      schema_from_db = Repo.get(Country, returned_schema.id)
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
      existing_schema = insert(:country)

      bad_params = bad_country_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               update_country(existing_schema, bad_params)

      assert existing_schema == Repo.get(Country, existing_schema.id)
    end
  end

  describe "update_state/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:state)

      params = string_params_for(:state)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %State{} = returned_schema} = update_state(existing_schema, params)

      schema_from_db = Repo.get(State, returned_schema.id)
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
      existing_schema = insert(:state)

      bad_params = bad_state_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               update_state(existing_schema, bad_params)

      assert existing_schema == Repo.get(State, existing_schema.id)
    end
  end

  describe "update_zone/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:zone)

      params = string_params_for(:zone)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Zone{} = returned_schema} = update_zone(existing_schema, params)

      schema_from_db = Repo.get(Zone, returned_schema.id)
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
      existing_schema = insert(:zone)

      bad_params = bad_zone_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               update_zone(existing_schema, bad_params)

      assert existing_schema == Repo.get(Zone, existing_schema.id)
    end
  end

  # Delete
  describe "delete_country/1" do
    test "success: it deletes the schema" do
      schema = insert(:country)

      assert {:ok, _deleted_schema} = delete_country(schema)

      refute Repo.get(Country, schema.id)
    end
  end

  describe "delete_state/1" do
    test "success: it deletes the schema" do
      schema = insert(:state)

      assert {:ok, _deleted_schema} = delete_state(schema)

      refute Repo.get(State, schema.id)
    end
  end

  describe "delete_zone/1" do
    test "success: it deletes the schema" do
      schema = insert(:zone)

      assert {:ok, _deleted_schema} = delete_zone(schema)

      refute Repo.get(Zone, schema.id)
    end
  end
end