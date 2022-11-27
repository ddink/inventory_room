defmodule InventoryRoom.DataCase do
	use ExUnit.CaseTemplate
	alias StoreRepo.Repo
	alias Ecto.Changeset

	alias InventoryRoom.Products.{
		OptionType,
    OptionValue,
    Price,
    Product,
    ProductImage,
    Property,
    Taxon,
    Taxonomy,
    Variant,
    VariantImage
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

  alias InventoryRoom.Settings.Shipping.{
    ShippingCategory,
    StockLocation
  }

  alias InventoryRoom.Settings.StoreCredits.{
    Credit,
    CreditCategory,
    CreditReason,
    CreditType
  }

  alias InventoryRoom.Settings.Taxes.{
    TaxCategory,
    TaxRate
  }

  alias InventoryRoom.Settings.Zones.{
    Country,
    State,
    Zone
  }

  alias InventoryRoom.Settings.{
    PaymentMethod,
    Store
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

  # Products Schemas
	def option_type_fields, do: OptionType.fields()
  def option_value_fields, do: OptionValue.fields()
  def price_fields, do: Price.fields()
  def price_required_fields, do: Price.required_fields()
  def product_fields, do: Product.required_fields()
  def product_image_fields(), do: ProductImage.required_fields()
  def property_fields, do: Property.fields()
  def taxon_fields, do: Taxon.fields()
  def taxonomy_fields, do: Taxonomy.fields()
  def variant_fields, do: Variant.fields()
  def variant_image_fields, do: VariantImage.fields()
  
  # Promotions Schemas
  def promotion_fields, do: Promotion.fields()
  def promotion_category_fields, do: PromotionCategory.fields()
  def promotion_code_fields, do: PromotionCode.fields()

  # Refunds and Reasons Schemas
  def adjustment_fields, do: Adjustment.fields()
  def adjustment_reason_fields, do: AdjustmentReason.fields()
  def refund_reason_fields, do: RefundReason.fields()
  def reimbursement_type_fields, do: ReimbursementType.fields()
  def return_reason_fields, do: ReturnReason.fields()

  # Shipping Schemas
  def shipping_category_fields, do: ShippingCategory.fields()
  def stock_location_fields, do: StockLocation.fields()

  # Store Credit Schemas
  def credit_fields, do: Credit.fields()
  def credit_category_fields, do: CreditCategory.fields()
  def credit_reason_fields, do: CreditReason.fields()
  def credit_type_fields, do: CreditType.fields()

  # Tax Schemas
  def tax_category_fields, do: TaxCategory.fields()
  def tax_rate_fields, do: TaxRate.fields()

  # Zone Schemas
  def country_fields, do: Country.fields()
  def state_fields, do: State.fields()
  def zone_fields, do: Zone.fields()

  # Setting Schemas
  def payment_method_fields, do: PaymentMethod.fields()
  def store_fields, do: Store.fields()

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

  def bad_taxon_params do
    %{
      "parent_id" => "not_an_integer",
      "position" => %{},
      "name" => 0,
      "permalink" => %{},
      "taxonomy_id" => NaiveDateTime.utc_now(),
      "icon_file_name" => 0,
      "icon_content_type" => %{},
      "icon_file_size" => "not_an_integer",
      "icon_updated_at" => 0,
      "description" => %{},
      "meta_title" => 0,
      "meta_description" => %{},
      "meta_keywords" => 0
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

  def bad_shipping_category_params do
    %{
      "name" => %{}
    }
  end

  def bad_stock_location_params do
    %{
      "name" => %{},
      "default" => 0,
      "address1" => %{},
      "address2" => 0,
      "city" => %{},
      "zipcode" => 0,
      "phone" => %{},
      "active" => 0,
      "backorderable_default" => %{},
      "propagate_all_variants" => 0,
      "internal_name" => %{},
      "restock_inventory" => %{},
      "fulfillable" => 0,
      "code" => %{},
      "check_stock_on_transfer" => 0,
      "position" => %{}
    }
  end

  def bad_credit_category_params do
    %{
      "name" => %{}
    }
  end

  def bad_credit_reason_params do
    %{
      "name" => %{}
    }
  end

  def bad_credit_type_params do
    %{
      "name" => %{},
      "priority" => "not_an_integer"
    }
  end

  def bad_credit_params do
    %{
      "amount" => %{},
      "amount_used" => "not_an_integer",
      "amount_authorized" => NaiveDateTime.utc_now(),
      "currency" => %{},
      "memo" => 0,
      "deleted_at" => %{},
      "invalidated_at" => 0,
      "created_by_id" => "not_an_id",
      "user_id" => %{},
      "credit_category_id" => "not_an_id",
      "credit_type_id" => %{} 
    }
  end

  def bad_tax_category_params do
    %{
      "name" => %{},
      "description" => 0,
      "is_default" => "not_false",
      "tax_code" => %{}
    }
  end

  def bad_country_params do
    %{
      "iso_name" => %{},
      "iso" => 0,
      "iso3" => %{},
      "name" => 0,
      "numcode" => %{},
      "states_required" => 0
    }
  end

  def bad_state_params do
    %{
      "name" => %{},
      "abbr" => 0,
      "country_id" => "not_an_integer"
    }
  end

  def bad_zone_params do
    %{
      "name" => %{},
      "description" => 0,
      "zone_members_count" => "not_an_integer",
      "type" => %{},
      "default_tax" => 0
    }
  end

  def bad_payment_method_params do
    %{
      "name" => %{},
      "type" => 0,
      "description" => true,
      "active" => %{},
      "available_to_users" => "not_false",
      "available_to_admin" => 0,
    "auto_capture" => %{}
    }
  end

  def bad_store_params do
    %{
      "name" => %{},
      "url" => 0,
      "meta_description" => %{},
      "meta_keywords" => 0,
      "seo_title" => %{},
      "default_currency" => 0,
      "currency" => %{},
      "default" => 0,
      "cart_tax_country_iso" => %{},
      "mail_from_address" => 0
    }
  end

  def bad_product_params do
    %{
      "name" => %{},
      "slug" => 0,
      "description" => %{},
      "meta_title" => 0,
      "meta_keywords" => %{},
      "available_on" => 0,
      "discontinue_on" => %{},
      "promotionable" => 0,
      "master_sku" => %{},
      "shipping_category_id" => 0,
      "tax_category_id" => %{}
    }
  end

  def bad_product_image_params do
    %{
      "file" => %{},
      "product_id" => "not_an_integer",
      "alt_text" => 0,
      "url" => %{}
    }
  end

  def bad_variant_params do
    %{
      "sku" => %{},
      "weight" => "not_a_decimal",
      "height" => NaiveDateTime.utc_now(),
      "depth" => %{},
      "width" => NaiveDateTime.utc_now(),
      "deleted_at" => %{},
      "is_master" => "not_false",
      "product_id" => NaiveDateTime.utc_now(),
      "cost_price" => %{},
      "position" => "not_a_integer",
      "cost_currency" => 0,
      "track_inventory" => %{},
      "tax_category_id" => "not_a_integer"
    }
  end

  def bad_variant_image_params do
    %{
      "file" => %{},
      "product_id" => "not_an_integer",
      "alt_text" => 0,
      "url" => %{},
      "variant_id" => %{}
    }
  end

  def bad_tax_rate_params do
    %{
      "amount" => %{},
      "zone_id" => "not_an_integer",
      "included_in_price" => 0,
      "name" => %{},
      "show_rate_in_label" => "not_an_integer",
      "deleted_at" => 0
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