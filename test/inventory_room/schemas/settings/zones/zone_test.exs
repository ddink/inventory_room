defmodule InventoryRoom.Settings.Zones.ZoneTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.Zones.Zone

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:zone)

      assert_valid_changeset(params, zone_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_zone_params()

      assert_invalid_changeset(
        params,
        zone_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:zone)

      assert_valid_changeset(params, zone_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_zone_params()

      assert_invalid_changeset(
        bad_params,
        zone_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end