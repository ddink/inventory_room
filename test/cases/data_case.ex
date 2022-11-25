defmodule InventoryRoom.DataCase do
	use ExUnit.CaseTemplate
	alias StoreRepo.Repo
	alias Ecto.Changeset

	alias InventoryRoom.Products.{
		OptionType,
    OptionValue,
    Price,
    Property,
    Taxonomy
	}

  alias InventoryRoom.Promotions.{
    Promotion,
    PromotionCategory,
    PromotionCode
  }

  alias InventoryRoom.Settings.RefundsAndReturns.{
    Adjustment,
    AdjustmentReason,
    RefundReason,
    ReimbursementType,
    ReturnReason
  }

	using do
		quote do
			import InventoryRoom.DataCase
			alias InventoryRoom.Factory
		end
	end

	def assert_valid_changeset(params, fields, changeset_fn) when is_list(fields) do
    changeset = changeset_fn.(params)

    assert %Changeset{valid?: true, changes: changes} = changeset

    params = atom_map(params)

    for field <- fields do
      actual = Map.get(changes, field)
      expected = params[field]

      assert actual == expected,
             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
    end
  end

	def assert_invalid_changeset(params, fields, changeset_fn, validation_type)
      when is_list(fields) do
    # changeset = Cart.create_order_changeset(params)
    changeset = changeset_fn.(params)

    assert %Changeset{
             valid?: false,
             errors: errors
           } = changeset
           
    assert_error_fields(errors, fields, validation_type)
  end

	def assert_error_fields(errors, fields, validation_type) when is_atom(validation_type) do
    for field <- fields do
      assert errors[field], "expected an error for #{field}"
      {_, meta} = errors[field]

      assert meta[:validation] == validation_type,
             "The validation type, #{meta[:validation]}, is incorrect."
    end
  end

	def option_type_fields, do: OptionType.fields()
  def option_value_fields, do: OptionValue.fields()
  def price_fields, do: Price.fields()
  def price_required_fields, do: Price.required_fields()
  def property_fields, do: Property.fields()
  def taxonomy_fields, do: Taxonomy.fields()
  
  def promotion_fields, do: Promotion.fields()
  def promotion_category_fields, do: PromotionCategory.fields()
  def promotion_code_fields, do: PromotionCode.fields()

  def adjustment_fields, do: Adjustment.fields()
  def adjustment_reason_fields, do: AdjustmentReason.fields()
  def refund_reason_fields, do: RefundReason.fields()
  def reimbursement_type_fields, do: ReimbursementType.fields()
  def return_reason_fields, do: ReturnReason.fields()

	def bad_option_type_params do
		%{
			"name" => %{},
			"presentation" => 0,
			"position" => "not_an_integer"
		}
	end

  def bad_option_value_params do
    %{
      "position" => %{},
      "name" => 0,
      "presentation" => %{},
      "option_type_id" => "not_an_integer"
    }
  end

  def bad_price_params do
    %{
      "amount" => "not_a_decimal",
      "currency" => 0,
      "deleted_at" => %{},
      "is_default" => "n/a",
      "country_iso" => 0,
      "variant_id" => %{}
    }
  end

  def bad_property_params do
    %{
      "name" => %{},
      "presentation" => 0
    }
  end

  def bad_taxonomy_params do
    %{
      "name" => 0,
      "position" => "not_an_integer"
    }
  end

  def bad_promotion_category_params do
    %{
      "name" => 0,
      "code" => %{}
    }
  end

  def bad_promotion_params do
    %{
      "description" => %{},
      "start_at" => NaiveDateTime.utc_now(),
      "expires_at" => NaiveDateTime.utc_now(),
      "name" => 0,
      "type" => %{},
      "usage_limit" => "not_an_integer",
      "match_policy" => 0,
      "code" => %{},
      "advertise" => "not_true",
      "path" => 0,
      "promotion_category_id" => %{},
      "per_code_usage_limit" => "not_an_integer",
      "apply_automatically" => "not_false"
    }
  end

  def bad_promotion_code_params do
    %{
      "promotion_id" => "not_an_integer",
      "value" => %{}
    }
  end

  def bad_adjustment_reason_params do
    %{
      "name" => 0,
      "code" => false,
      "active" => %{}
    }
  end

  def bad_adjustment_params do
    %{
      "amount" => %{},
      "label" => 0,
      "eligible" => "not_false",
      "order_id" => %{},
      "promotion_code_id" => %{},
      "adjustment_reason_id" => %{}
    }
  end

  def bad_refund_reason_params do
    %{
      "name" => %{},
      "active" => "not_false",
      "mutable" => 0,
      "code" => %{}
    }
  end

  def bad_reimbursement_type_params do
    %{
      "name" => %{},
      "active" => "not_false",
      "mutable" => 0,
      "type" => %{}
    }
  end

  def bad_return_reason_params do
    %{
      "name" => %{},
      "active" => "not_false",
      "mutable" => 0
    }
  end

	def atom_map(string_key_map) do
    for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), val}
  end

	setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end
end