defmodule InventoryRoom.Settings.RefundsAndReturns.CustomerReturnTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.RefundsAndReturns.CustomerReturn

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:customer_return)

      assert_valid_changeset(params, customer_return_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_customer_return_params()

      assert_invalid_changeset(
        params,
        customer_return_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:customer_return)

      assert_valid_changeset(params, customer_return_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_customer_return_params()

      assert_invalid_changeset(
        bad_params,
        customer_return_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end