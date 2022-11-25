defmodule InventoryRoom.Settings.PaymentMethodTest do
  use InventoryRoom.DataCase, async: true
  import InventoryRoom.Settings.PaymentMethod

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:payment_method)

      assert_valid_changeset(params, payment_method_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_payment_method_params()

      assert_invalid_changeset(
        params,
        payment_method_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:payment_method)

      assert_valid_changeset(params, payment_method_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_payment_method_params()

      assert_invalid_changeset(
        bad_params,
        payment_method_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end