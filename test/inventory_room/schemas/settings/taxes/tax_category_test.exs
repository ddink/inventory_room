defmodule InventoryRoom.Settings.Taxes.TaxCategoryTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.Taxes.TaxCategory

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:tax_category)

      assert_valid_changeset(params, tax_category_fields(), &TaxCategory.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_tax_category_params()

      assert_invalid_changeset(
        params,
        tax_category_fields(),
        &TaxCategory.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:tax_category)

      assert_valid_changeset(params, tax_category_fields(), &TaxCategory.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_tax_category_params()

      assert_invalid_changeset(
        bad_params,
        tax_category_fields(),
        &TaxCategory.create_changeset/1,
        :cast
      )
    end
  end
end