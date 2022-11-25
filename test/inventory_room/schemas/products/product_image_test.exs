defmodule InventoryRoom.Products.ProductImageTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  import InventoryRoom.Products.ProductImage
  
  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:product_image)

      assert_valid_changeset(params, product_image_fields(), &changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_product_image_params()

      assert_invalid_changeset(
        params,
        product_image_fields(),
        &changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:product_image)

      assert_valid_changeset(params, product_image_fields(), &create_changeset/1)
    end

    test "error: returns an error changeset with required validation error when missing required fields" do
      required_fields = required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
      params = Factory.string_params_for(:product_image)
               |> Map.drop(required_fields)
      changeset = create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_product_image_params()

      assert_invalid_changeset(
        bad_params,
        product_image_fields(),
        &create_changeset/1,
        :cast
      )
    end
  end
end