defmodule InventoryRoom.Promotions.PromotionCategoryTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Promotions.PromotionCategory
  
  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion_category)

      assert_valid_changeset(params, promotion_category_fields(), &PromotionCategory.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_promotion_category_params()

      assert_invalid_changeset(
        params,
        promotion_category_fields(),
        &PromotionCategory.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion_category)

      assert_valid_changeset(params, promotion_category_fields(), &PromotionCategory.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_promotion_category_params()

      assert_invalid_changeset(
        bad_params,
        promotion_category_fields(),
        &PromotionCategory.create_changeset/1,
        :cast
      )
    end
  end
end