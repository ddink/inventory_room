defmodule InventoryRoom.Settings.Shipping.ShipmentTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Settings.Shipping.Shipment

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipment)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      shipment_fields = shipment_fields() -- decimal_fields()

      for field <- shipment_fields do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :shipped_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end

      for field <- decimal_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        assert expected == actual |> Decimal.to_float()
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_shipment_params()

      assert_invalid_changeset(
        params,
        shipment_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipment)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      shipment_fields = shipment_fields() -- decimal_fields()

      for field <- shipment_fields do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :shipped_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end

      for field <- decimal_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        assert expected == actual |> Decimal.to_float()
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_shipment_params()

      assert_invalid_changeset(
        bad_params,
        shipment_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end