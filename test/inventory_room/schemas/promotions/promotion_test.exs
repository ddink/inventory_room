defmodule InventoryRoom.Promotions.PromotionTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  alias InventoryRoom.Promotions.Promotion
  
  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion)

      # assert_valid_changeset(params, promotion_fields(), &Promotion.changeset/1)

      changeset = Promotion.changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- promotion_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :starts_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          :expires_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_promotion_params()
      fields = promotion_fields() -- Promotion.date_fields()

      assert_invalid_changeset(
        params,
        fields,
        &Promotion.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:promotion)

      # assert_valid_changeset(params, promotion_fields(), &Promotion.create_changeset/1)

      changeset = Promotion.create_changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- price_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        case field do
          :starts_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          :expires_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_promotion_params()
      fields = promotion_fields() -- Promotion.date_fields()

      assert_invalid_changeset(
        bad_params,
        fields,
        &Promotion.create_changeset/1,
        :cast
      )
    end
  end
end