defmodule InventoryRoom.Joins.ShippingMethodZoneTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Joins.ShippingMethodZone

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_method_zone)

      assert_valid_changeset(params, shipping_method_zone_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_shipping_method_zone_params()

      assert_invalid_changeset(
        params,
        shipping_method_zone_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_method_zone)

      assert_valid_changeset(params, shipping_method_zone_fields(), &changeset/1)
    end

    test "error: returns an error changeset with required validation error when missing required fields" do
      required_fields = required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
      params = Factory.string_params_for(:refund)
               |> Map.drop(required_fields)
      changeset = create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_shipping_method_zone_params()

      assert_invalid_changeset(
        bad_params,
        shipping_method_zone_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end