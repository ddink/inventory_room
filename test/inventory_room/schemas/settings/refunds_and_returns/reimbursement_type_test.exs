defmodule InventoryRoom.Settings.RefundsAndReturns.ReimbursementTypeTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.RefundsAndReturns.ReimbursementType

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:reimbursement_type)

      assert_valid_changeset(params, reimbursement_type_fields(), &ReimbursementType.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_reimbursement_type_params()

      assert_invalid_changeset(
        params,
        reimbursement_type_fields(),
        &ReimbursementType.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:reimbursement_type)

      assert_valid_changeset(params, reimbursement_type_fields(), &ReimbursementType.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_reimbursement_type_params()

      assert_invalid_changeset(
        bad_params,
        reimbursement_type_fields(),
        &ReimbursementType.create_changeset/1,
        :cast
      )
    end
  end
end