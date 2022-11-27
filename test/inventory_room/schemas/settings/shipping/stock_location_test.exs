defmodule InventoryRoom.Settings.Shipping.StockLocationTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Settings.Shipping.StockLocation

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:stock_location)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- stock_location_fields() do
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
      params = bad_stock_location_params()

      assert_invalid_changeset(
        params,
        stock_location_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:stock_location)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- stock_location_fields() do
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

    test "error: returns an error changeset with required validation error when missing required fields" do
      required_fields = required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
      params = Factory.string_params_for(:stock_location)
               |> Map.drop(required_fields)
      changeset = create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_stock_location_params()

      assert_invalid_changeset(
        bad_params,
        stock_location_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end