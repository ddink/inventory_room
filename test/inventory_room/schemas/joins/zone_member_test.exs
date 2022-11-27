defmodule InventoryRoom.Joins.ZoneMemberTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Joins.ZoneMember

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:zone_member)

      assert_valid_changeset(params, zone_member_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_zone_member_params()

      assert_invalid_changeset(
        params,
        zone_member_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:zone_member)

      assert_valid_changeset(params, zone_member_fields(), &changeset/1)
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
      bad_params = bad_zone_member_params()

      assert_invalid_changeset(
        bad_params,
        zone_member_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end