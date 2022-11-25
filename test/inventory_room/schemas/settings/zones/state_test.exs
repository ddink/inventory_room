defmodule InventoryRoom.Settings.Zones.StateTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.Zones.State

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:state)

      assert_valid_changeset(params, state_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_state_params()

      assert_invalid_changeset(
        params,
        state_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:state)

      assert_valid_changeset(params, state_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_state_params()

      assert_invalid_changeset(
        bad_params,
        state_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end