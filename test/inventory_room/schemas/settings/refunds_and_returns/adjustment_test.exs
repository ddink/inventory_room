defmodule InventoryRoom.Settings.RefundsAndReturns.AdjustmentTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  alias InventoryRoom.Settings.RefundsAndReturns.Adjustment

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:adjustment)

      changeset = Adjustment.changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- price_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_adjustment_params()

      assert_invalid_changeset(
        params,
        adjustment_fields(),
        &Adjustment.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:adjustment)

      changeset = Adjustment.create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- price_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_adjustment_params()

      assert_invalid_changeset(
        bad_params,
        adjustment_fields(),
        &Adjustment.create_changeset/1,
        :cast
      )
    end
  end
end