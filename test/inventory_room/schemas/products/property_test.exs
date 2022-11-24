defmodule InventoryRoom.Products.PropertyTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Products.Property
  
  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:property)

      assert_valid_changeset(params, property_fields(), &Property.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_property_params()

      assert_invalid_changeset(
        params,
        property_fields(),
        &Property.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:property)

      assert_valid_changeset(params, property_fields(), &Property.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_property_params()

      assert_invalid_changeset(
        bad_params,
        property_fields(),
        &Property.create_changeset/1,
        :cast
      )
    end
  end
end