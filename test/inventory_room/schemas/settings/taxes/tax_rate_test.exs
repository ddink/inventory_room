defmodule InventoryRoom.Settings.Taxes.TaxRateTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Settings.Taxes.TaxRate

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:tax_rate)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- price_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

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
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_tax_rate_params()

      assert_invalid_changeset(
        params,
        tax_rate_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:tax_rate)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- price_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

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
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_tax_rate_params()

      assert_invalid_changeset(
        bad_params,
        tax_rate_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end