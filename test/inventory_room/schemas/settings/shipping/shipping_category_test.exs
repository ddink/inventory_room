defmodule InventoryRoom.Settings.Shipping.ShippingCategoryTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.Shipping.ShippingCategory

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_category)

      assert_valid_changeset(params, shipping_category_fields(), &ShippingCategory.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_shipping_category_params()

      assert_invalid_changeset(
        params,
        shipping_category_fields(),
        &ShippingCategory.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:shipping_category)

      assert_valid_changeset(params, shipping_category_fields(), &ShippingCategory.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_shipping_category_params()

      assert_invalid_changeset(
        bad_params,
        shipping_category_fields(),
        &ShippingCategory.create_changeset/1,
        :cast
      )
    end
  end
end