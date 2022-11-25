defmodule InventoryRoom.Settings.Zones.CountryTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.Zones.Country

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:country)

      assert_valid_changeset(params, country_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_country_params()

      assert_invalid_changeset(
        params,
        country_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:country)

      assert_valid_changeset(params, country_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_country_params()

      assert_invalid_changeset(
        bad_params,
        country_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end