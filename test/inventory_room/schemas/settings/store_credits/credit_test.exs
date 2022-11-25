defmodule InventoryRoom.Settings.StoreCredits.CreditTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
  alias InventoryRoom.Settings.StoreCredits.Credit

  describe "changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:credit)

      # assert_valid_changeset(params, credit_fields(), &Credit.changeset/1)

      changeset = Credit.changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- credit_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        if field in Credit.decimal_fields() do
          assert expected == actual |> Decimal.to_float()
        end

        if field in Credit.naive_datetime_fields() do
          assert expected == actual |> NaiveDateTime.to_string()
        end

        unless field in Credit.decimal_fields() or
               field in Credit.naive_datetime_fields() do
                assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"      
        end

        # case field do
        #   :amount ->
        #     assert expected == actual |> Decimal.to_float()
        #   :deleted_at ->
        #     assert expected == actual |> NaiveDateTime.to_string()
        #   _ ->
        #     assert actual == expected,
        #       "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        # end     
      end
    end

    test "error: returns an error changeset when given un-castable values" do
      params = bad_credit_params()

      assert_invalid_changeset(
        params,
        credit_fields(),
        &Credit.changeset/1,
        :cast
      )
    end
  end

  describe "create_changeset/1" do
    test "success: returns a valid changeset when given valid arguments" do
      params = Factory.string_params_for(:credit)

      # assert_valid_changeset(params, credit_fields(), &Credit.create_changeset/1)

      changeset = Credit.changeset(params)

      assert %Changeset{valid?: true, changes: changes} = changeset

      params = atom_map(params)

      for field <- credit_fields() do
        actual = Map.get(changes, field)
        expected = params[field]

        if field in Credit.decimal_fields() do
          assert expected == actual |> Decimal.to_float()
        end

        if field in Credit.naive_datetime_fields() do
          assert expected == actual |> NaiveDateTime.to_string()
        end

        unless field in Credit.decimal_fields() or
               field in Credit.naive_datetime_fields() do
                assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"      
        end
      end
    end

    test "error: returns an error changeset with required validation error when missing required fields" do
      required_fields = Credit.required_fields() |> Enum.map(fn x -> Atom.to_string(x) end)
      params = Factory.string_params_for(:credit)
               |> Map.drop(required_fields)
      changeset = Credit.create_changeset(params)

      assert %Changeset{valid?: false, errors: errors} = changeset

      assert_error_fields(errors, Credit.required_fields(), :required)
    end

    test "error: returns an error changeset when given un-castable values" do
      bad_params = bad_credit_params()

      assert_invalid_changeset(
        bad_params,
        credit_fields(),
        &Credit.create_changeset/1,
        :cast
      )
    end
  end
end