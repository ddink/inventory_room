defmodule InventoryRoom.Settings.RefundsAndReturns.ReimbursementTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Settings.RefundsAndReturns.Reimbursement

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:reimbursement)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- reimbursement_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :total ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_reimbursement_params()

      assert_invalid_changeset(
        params,
        reimbursement_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:reimbursement)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- reimbursement_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :total ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_reimbursement_params()

      assert_invalid_changeset(
        bad_params,
        reimbursement_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end