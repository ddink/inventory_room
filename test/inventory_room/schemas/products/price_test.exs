defmodule InventoryRoom.Products.PriceTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  alias InventoryRoom.Products.Price

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:price)

      changeset = Price.changeset(params)

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

    test "error: returns an error changeset when given an invalid length for country_iso" do
      params = Factory.string_params_for(:price)
               |> Map.replace("country_iso", "USA")

      changeset = Price.changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert errors[:country_iso], "expected an error for country_iso"
      {_, meta} = errors[:country_iso]

      assert meta[:validation] == :length,
             "The validation type, #{meta[:validation]}, is incorrect."
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_price_params()

      assert_invalid_changeset(
        params,
        price_fields(),
        &Price.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:price)

      changeset = Price.create_changeset(params)

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

    test "error: returns an error changeset when given an invalid length for country_iso" do
      params = Factory.string_params_for(:price)
               |> Map.replace("country_iso", "USA")

      changeset = Price.create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert errors[:country_iso], "expected an error for country_iso"
      {_, meta} = errors[:country_iso]

      assert meta[:validation] == :length,
             "The validation type, #{meta[:validation]}, is incorrect."
    end

    test "error: returns an error changeset with required validation error when missing required fields" do
      params = Factory.string_params_for(:price)
               |> Map.drop(["variant_id", "is_default"])
      changeset = Price.create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, price_required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_price_params()

      assert_invalid_changeset(
        bad_params,
        price_fields(),
        &Price.create_changeset/1,
        :cast
      )
    end
  end
end