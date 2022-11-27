defmodule InventoryRoom.Orders.PaymentTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Orders.Payment

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:payment)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- payment_fields() do
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

    # test "error: returns an error changeset when given an invalid length for country_iso" do
    #   params = Factory.string_params_for(:payment)
    #            |> Map.replace("country_iso", "USA")

    #   changeset = changeset(params)

    #   assert %Changeset{valid?: false, errors: errors} = changeset

    #   assert errors[:country_iso], "expected an error for country_iso"
    #   {_, meta} = errors[:country_iso]

    #   assert meta[:validation] == :length,
    #          "The validation type, #{meta[:validation]}, is incorrect."
    # end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_payment_params()

      assert_invalid_changeset(
        params,
        payment_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:payment)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- payment_fields() do
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

    # test "error: returns an error changeset when given an invalid length for country_iso" do
    #   params = Factory.string_params_for(:payment)
    #            |> Map.replace("country_iso", "USA")

    #   changeset = create_changeset(params)

    #   assert %Changeset{valid?: false, errors: errors} = changeset

    #   assert errors[:country_iso], "expected an error for country_iso"
    #   {_, meta} = errors[:country_iso]

    #   assert meta[:validation] == :length,
    #          "The validation type, #{meta[:validation]}, is incorrect."
    # end

    test "error: returns an error changeset with required validation error when missing required fields" do
      required_fields = required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
      params = Factory.string_params_for(:payment)
               |> Map.drop(required_fields)
      changeset = create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_payment_params()

      assert_invalid_changeset(
        bad_params,
        payment_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end