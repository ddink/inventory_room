defmodule InventoryRoom.Settings.StoreCredits.CreditCategoryTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Settings.StoreCredits.CreditCategory

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:credit_category)

      assert_valid_changeset(params, credit_category_fields(), &CreditCategory.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_credit_category_params()

      assert_invalid_changeset(
        params,
        credit_category_fields(),
        &CreditCategory.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:credit_category)

      assert_valid_changeset(params, credit_category_fields(), &CreditCategory.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_credit_category_params()

      assert_invalid_changeset(
        bad_params,
        credit_category_fields(),
        &CreditCategory.create_changeset/1,
        :cast
      )
    end
  end
end