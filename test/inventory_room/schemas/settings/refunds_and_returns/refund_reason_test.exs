defmodule InventoryRoom.Settings.RefundsAndReturns.RefundReasonTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.RefundsAndReturns.RefundReason

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:refund_reason)

      assert_valid_changeset(params, refund_reason_fields(), &RefundReason.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_refund_reason_params()

      assert_invalid_changeset(
        params,
        refund_reason_fields(),
        &RefundReason.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:refund_reason)

      assert_valid_changeset(params, refund_reason_fields(), &RefundReason.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_refund_reason_params()

      assert_invalid_changeset(
        bad_params,
        refund_reason_fields(),
        &RefundReason.create_changeset/1,
        :cast
      )
    end
  end
end