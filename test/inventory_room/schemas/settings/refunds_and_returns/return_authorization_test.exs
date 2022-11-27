defmodule InventoryRoom.Settings.RefundsAndReturns.ReturnAuthorizationTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.RefundsAndReturns.ReturnAuthorization

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:return_authorization)

      assert_valid_changeset(params, return_authorization_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_return_authorization_params()

      assert_invalid_changeset(
        params,
        return_authorization_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:return_authorization)

      assert_valid_changeset(params, return_authorization_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_return_authorization_params()

      assert_invalid_changeset(
        bad_params,
        return_authorization_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end