defmodule InventoryRoom.Promotions.PromotionCodeTest do
  use InventoryRoom.DataCase, async: true
  alias InventoryRoom.Promotions.PromotionCode

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion_code)

      assert_valid_changeset(params, promotion_code_fields(), &PromotionCode.changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_promotion_code_params()

      assert_invalid_changeset(
        params,
        promotion_code_fields(),
        &PromotionCode.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion_code)

      assert_valid_changeset(params, promotion_code_fields(), &PromotionCode.create_changeset/1)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_promotion_code_params()

      assert_invalid_changeset(
        bad_params,
        promotion_code_fields(),
        &PromotionCode.create_changeset/1,
        :cast
      )
    end
  end
end