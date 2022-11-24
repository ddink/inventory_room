defmodule InventoryRoom.Products.OptionValueTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Products.OptionValue

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:option_value)

      assert_valid_changeset(params, option_value_fields(), &OptionValue.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_option_value_params()

      assert_invalid_changeset(
        params,
        option_value_fields(),
        &OptionValue.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:option_value)

      assert_valid_changeset(params, option_value_fields(), &OptionValue.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_option_value_params()

      assert_invalid_changeset(
        bad_params,
        option_value_fields(),
        &OptionValue.create_changeset/1,
        :cast
      )
    end
  end
end