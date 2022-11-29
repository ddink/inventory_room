defmodule InventoryRoom.Contexts.RefundsAndReturnsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.RefundsAndReturns, as: Returns
  import InventoryRoom.Factory
	alias StoreRepo.Repo
  alias InventoryRoom.Settings.RefundsAndReturns.{
    AdjustmentReason,
    Adjustment,
    CustomerReturn,
    RefundReason,
    Refund,
    ReimbursementType,
    Reimbursement,
    ReturnAuthorization,
    ReturnReason
  }

  # Create
  describe "create_adjustment_reason/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:adjustment_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %AdjustmentReason{} = returned_schema} = 
        Returns.create_adjustment_reason(params)

      schema_from_db = Repo.get(AdjustmentReason, returned_schema.id)
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
      bad_params = bad_adjustment_reason_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_adjustment_reason(bad_params)
    end
  end

  describe "create_adjustment/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:adjustment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Adjustment{} = returned_schema} = 
        Returns.create_adjustment(params)

      schema_from_db = Repo.get(Adjustment, returned_schema.id)
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
      bad_params = bad_adjustment_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_adjustment(bad_params)
    end
  end
  
  describe "create_customer_return/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:customer_return)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CustomerReturn{} = returned_schema} = 
        Returns.create_customer_return(params)

      schema_from_db = Repo.get(CustomerReturn, returned_schema.id)
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
      bad_params = bad_customer_return_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_customer_return(bad_params)
    end
  end

  describe "create_refund_reason/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:refund_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %RefundReason{} = returned_schema} = 
        Returns.create_refund_reason(params)

      schema_from_db = Repo.get(RefundReason, returned_schema.id)
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
      bad_params = bad_refund_reason_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_refund_reason(bad_params)
    end
  end

  describe "create_refund/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:refund)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Refund{} = returned_schema} = 
        Returns.create_refund(params)

      schema_from_db = Repo.get(Refund, returned_schema.id)
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
      bad_params = bad_refund_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_refund(bad_params)
    end
  end

  describe "create_reimbursement_type/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:reimbursement_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReimbursementType{} = returned_schema} = 
        Returns.create_reimbursement_type(params)

      schema_from_db = Repo.get(ReimbursementType, returned_schema.id)
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
      bad_params = bad_reimbursement_type_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_reimbursement_type(bad_params)
    end
  end

  describe "create_reimbursement/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:reimbursement)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Reimbursement{} = returned_schema} = 
        Returns.create_reimbursement(params)

      schema_from_db = Repo.get(Reimbursement, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :total ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_reimbursement_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_reimbursement(bad_params)
    end
  end

  describe "create_return_authorization/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:return_authorization)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReturnAuthorization{} = returned_schema} = 
        Returns.create_return_authorization(params)

      schema_from_db = Repo.get(ReturnAuthorization, returned_schema.id)
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
      bad_params = bad_return_authorization_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_return_authorization(bad_params)
    end
  end

  describe "create_return_reason/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:return_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReturnReason{} = returned_schema} = 
        Returns.create_return_reason(params)

      schema_from_db = Repo.get(ReturnReason, returned_schema.id)
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
      bad_params = bad_return_reason_params()

      assert {:error, %Changeset{valid?: false}} = Returns.create_return_reason(bad_params)
    end
  end

  # Read
  describe "get_adjustment_reason/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:adjustment_reason)

      assert %AdjustmentReason{} = returned_schema = Returns.get_adjustment_reason(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_adjustment_reason(Enum.random(1..1000)) == nil
    end
  end

  describe "get_adjustment/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:adjustment)

      assert %Adjustment{} = returned_schema = Returns.get_adjustment(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_adjustment(Enum.random(1..1000)) == nil
    end
  end

  describe "get_customer_return/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:customer_return)

      assert %CustomerReturn{} = returned_schema = Returns.get_customer_return(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_customer_return(Enum.random(1..1000)) == nil
    end
  end

  describe "get_refund_reason/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:refund_reason)

      assert %RefundReason{} = returned_schema = Returns.get_refund_reason(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_refund_reason(Enum.random(1..1000)) == nil
    end
  end

  describe "get_refund/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:refund)

      assert %Refund{} = returned_schema = Returns.get_refund(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_refund(Enum.random(1..1000)) == nil
    end
  end

  describe "get_reimbursement_type/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:reimbursement_type)

      assert %ReimbursementType{} = returned_schema = Returns.get_reimbursement_type(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_reimbursement_type(Enum.random(1..1000)) == nil
    end
  end

  describe "get_reimbursement/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:reimbursement)

      assert %Reimbursement{} = returned_schema = Returns.get_reimbursement(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_reimbursement(Enum.random(1..1000)) == nil
    end
  end

  describe "get_return_authorization/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:return_authorization)

      assert %ReturnAuthorization{} = returned_schema = Returns.get_return_authorization(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_return_authorization(Enum.random(1..1000)) == nil
    end
  end

  describe "get_return_reason/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:return_reason)

      assert %ReturnReason{} = returned_schema = Returns.get_return_reason(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Returns.get_return_reason(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_adjustment_reason/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:adjustment_reason)

      params = string_params_for(:adjustment_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %AdjustmentReason{} = returned_schema} = Returns.update_adjustment_reason(existing_schema, params)

      schema_from_db = Repo.get(AdjustmentReason, returned_schema.id)
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
      existing_schema = insert(:adjustment_reason)

      bad_params = bad_adjustment_reason_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_adjustment_reason(existing_schema, bad_params)

      assert existing_schema == Repo.get(AdjustmentReason, existing_schema.id)
    end
  end

  describe "update_adjustment/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:adjustment)

      params = string_params_for(:adjustment)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Adjustment{} = returned_schema} = Returns.update_adjustment(existing_schema, params)

      schema_from_db = Repo.get(Adjustment, returned_schema.id)
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
      existing_schema = insert(:adjustment)

      bad_params = bad_adjustment_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_adjustment(existing_schema, bad_params)

      assert existing_schema == Repo.get(Adjustment, existing_schema.id)
    end
  end

  describe "update_customer_return/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:customer_return)

      params = string_params_for(:customer_return)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %CustomerReturn{} = returned_schema} = Returns.update_customer_return(existing_schema, params)

      schema_from_db = Repo.get(CustomerReturn, returned_schema.id)
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
      existing_schema = insert(:customer_return)

      bad_params = bad_customer_return_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_customer_return(existing_schema, bad_params)

      assert existing_schema == Repo.get(CustomerReturn, existing_schema.id)
    end
  end

  describe "update_refund_reason/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:refund_reason)

      params = string_params_for(:refund_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %RefundReason{} = returned_schema} = Returns.update_refund_reason(existing_schema, params)

      schema_from_db = Repo.get(RefundReason, returned_schema.id)
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
      existing_schema = insert(:refund_reason)

      bad_params = bad_refund_reason_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_refund_reason(existing_schema, bad_params)

      assert existing_schema == Repo.get(RefundReason, existing_schema.id)
    end
  end

  describe "update_refund/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:refund)

      params = string_params_for(:refund)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Refund{} = returned_schema} = Returns.update_refund(existing_schema, params)

      schema_from_db = Repo.get(Refund, returned_schema.id)
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
      existing_schema = insert(:refund)

      bad_params = bad_refund_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_refund(existing_schema, bad_params)

      assert existing_schema == Repo.get(Refund, existing_schema.id)
    end
  end

  describe "update_reimbursement_type/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:reimbursement_type)

      params = string_params_for(:reimbursement_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReimbursementType{} = returned_schema} = Returns.update_reimbursement_type(existing_schema, params)

      schema_from_db = Repo.get(ReimbursementType, returned_schema.id)
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
      existing_schema = insert(:reimbursement_type)

      bad_params = bad_reimbursement_type_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_reimbursement_type(existing_schema, bad_params)

      assert existing_schema == Repo.get(ReimbursementType, existing_schema.id)
    end
  end

  describe "update_reimbursement/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:reimbursement)

      params = string_params_for(:reimbursement)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Reimbursement{} = returned_schema} = Returns.update_reimbursement(existing_schema, params)

      schema_from_db = Repo.get(Reimbursement, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :total ->
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
      existing_schema = insert(:reimbursement)

      bad_params = bad_reimbursement_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_reimbursement(existing_schema, bad_params)

      assert existing_schema == Repo.get(Reimbursement, existing_schema.id)
    end
  end

  describe "update_return_authorization/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:return_authorization)

      params = string_params_for(:return_authorization)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReturnAuthorization{} = returned_schema} = Returns.update_return_authorization(existing_schema, params)

      schema_from_db = Repo.get(ReturnAuthorization, returned_schema.id)
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
      existing_schema = insert(:return_authorization)

      bad_params = bad_return_authorization_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_return_authorization(existing_schema, bad_params)

      assert existing_schema == Repo.get(ReturnAuthorization, existing_schema.id)
    end
  end

  describe "update_return_reason/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:return_reason)

      params = string_params_for(:return_reason)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ReturnReason{} = returned_schema} = Returns.update_return_reason(existing_schema, params)

      schema_from_db = Repo.get(ReturnReason, returned_schema.id)
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
      existing_schema = insert(:return_reason)

      bad_params = bad_return_reason_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Returns.update_return_reason(existing_schema, bad_params)

      assert existing_schema == Repo.get(ReturnReason, existing_schema.id)
    end
  end

  # Delete
  describe "delete_adjustment_reason/1" do
    test "success: it deletes the schema" do
      schema = insert(:adjustment_reason)

      assert {:ok, _deleted_schema} = Returns.delete_adjustment_reason(schema)

      refute Repo.get(AdjustmentReason, schema.id)
    end
  end

  describe "delete_adjustment/1" do
    test "success: it deletes the schema" do
      schema = insert(:adjustment)

      assert {:ok, _deleted_schema} = Returns.delete_adjustment(schema)

      refute Repo.get(Adjustment, schema.id)
    end
  end

  describe "delete_customer_return/1" do
    test "success: it deletes the schema" do
      schema = insert(:customer_return)

      assert {:ok, _deleted_schema} = Returns.delete_customer_return(schema)

      refute Repo.get(CustomerReturn, schema.id)
    end
  end

  describe "delete_refund_reason/1" do
    test "success: it deletes the schema" do
      schema = insert(:refund_reason)

      assert {:ok, _deleted_schema} = Returns.delete_refund_reason(schema)

      refute Repo.get(RefundReason, schema.id)
    end
  end

  describe "delete_refund/1" do
    test "success: it deletes the schema" do
      schema = insert(:refund)

      assert {:ok, _deleted_schema} = Returns.delete_refund(schema)

      refute Repo.get(Refund, schema.id)
    end
  end

  describe "delete_reimbursement_type/1" do
    test "success: it deletes the schema" do
      schema = insert(:reimbursement_type)

      assert {:ok, _deleted_schema} = Returns.delete_reimbursement_type(schema)

      refute Repo.get(ReimbursementType, schema.id)
    end
  end

  describe "delete_reimbursement/1" do
    test "success: it deletes the schema" do
      schema = insert(:reimbursement)

      assert {:ok, _deleted_schema} = Returns.delete_reimbursement(schema)

      refute Repo.get(Reimbursement, schema.id)
    end
  end

  describe "delete_return_authorization/1" do
    test "success: it deletes the schema" do
      schema = insert(:return_authorization)

      assert {:ok, _deleted_schema} = Returns.delete_return_authorization(schema)

      refute Repo.get(ReturnAuthorization, schema.id)
    end
  end

  describe "delete_return_reason/1" do
    test "success: it deletes the schema" do
      schema = insert(:return_reason)

      assert {:ok, _deleted_schema} = Returns.delete_return_reason(schema)

      refute Repo.get(ReturnReason, schema.id)
    end
  end
end