defmodule InventoryRoom.Products.TaxonomyTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Products.Taxonomy
  
  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:taxonomy)

      assert_valid_changeset(params, taxonomy_fields(), &Taxonomy.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_taxonomy_params()

      assert_invalid_changeset(
        params,
        taxonomy_fields(),
        &Taxonomy.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:taxonomy)

      assert_valid_changeset(params, taxonomy_fields(), &Taxonomy.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_taxonomy_params()

      assert_invalid_changeset(
        bad_params,
        taxonomy_fields(),
        &Taxonomy.create_changeset/1,
        :cast
      )
    end
  end
end