defmodule InventoryRoom.Settings.RefundsAndReturns.AdjustmentReasonTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.RefundsAndReturns.AdjustmentReason

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:adjustment_reason)

      assert_valid_changeset(params, adjustment_reason_fields(), &AdjustmentReason.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_adjustment_reason_params()

      assert_invalid_changeset(
        params,
        adjustment_reason_fields(),
        &AdjustmentReason.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:adjustment_reason)

      assert_valid_changeset(params, adjustment_reason_fields(), &AdjustmentReason.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_adjustment_reason_params()

      assert_invalid_changeset(
        bad_params,
        adjustment_reason_fields(),
        &AdjustmentReason.create_changeset/1,
        :cast
      )
    end
  end
end