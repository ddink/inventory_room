defmodule InventoryRoom.Settings.Shipping.ShippingMethodTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Settings.Shipping.ShippingMethod

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_method)

      changeset = changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- shipping_method_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :deleted_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_shipping_method_params()

      assert_invalid_changeset(
        params,
        shipping_method_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_method)

      changeset = create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- shipping_method_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :deleted_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    # test "error: returns an error changeset with required validation error when missing required fields" do
    #   required_fields = required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
    #   params = Factory.string_params_for(:shipping_method)
    #            |> Map.drop(required_fields)
    #   changeset = create_changeset(params)

    #   assert %Changeset{valid?: false, errors: errors} = changeset

    #   assert_error_fields(errors, required_fields(), :required)
    # end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_shipping_method_params()

      assert_invalid_changeset(
        bad_params,
        shipping_method_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end