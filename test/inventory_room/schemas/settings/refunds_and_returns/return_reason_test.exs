defmodule InventoryRoom.Settings.RefundsAndReturns.ReturnReasonTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.RefundsAndReturns.ReturnReason

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:return_reason)

      assert_valid_changeset(params, return_reason_fields(), &ReturnReason.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_return_reason_params()

      assert_invalid_changeset(
        params,
        return_reason_fields(),
        &ReturnReason.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:return_reason)

      assert_valid_changeset(params, return_reason_fields(), &ReturnReason.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_return_reason_params()

      assert_invalid_changeset(
        bad_params,
        return_reason_fields(),
        &ReturnReason.create_changeset/1,
        :cast
      )
    end
  end
end