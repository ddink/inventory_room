defmodule InventoryRoom.Factory do
  use ExMachina.Ecto, repo: StoreRepo.Repo

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

  alias InventoryRoom.Settings.Shipping.{
    ShippingCategory
  }

  def option_type_factory do
    option = ["size", "color", "style"] |> Enum.random()
    
    %OptionType{
      name: "product-#{option}",
      presentation: option,
      position: Enum.random(1..10)
    }
  end

  def option_value_factory do
    option_type = insert(:option_type)
    presentation_map = %{
      "extra small" => "XS",
      "small" => "S",
      "medium" => "M",
      "large" => "L",
      "extra large" => "XL"
    }
    value = presentation_map 
            |> Map.keys() 
            |> Enum.random()
    
    %OptionValue{
      position: Enum.random(1..10),
      name: value,
      presentation: presentation_map[value],
      option_type_id: option_type.id
    }
  end

  def price_factory do
    # variant = insert(:variant)
    currency_code = ["USD", "EUR", "GBP"] |> Enum.random()
    country_iso = Countries.filter_by(:currency_code, currency_code) 
                  |> Enum.random() 
                  |> Map.get(:alpha2)
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    amount = FakerElixir.Number.decimal(2,2)
             |> Decimal.new
             |> Decimal.to_float
    
    %Price{
      amount: amount,
      currency: currency_code,
      deleted_at: deleted_at,
      is_default: false,
      country_iso: country_iso,
      # variant_id: variant.id
      variant_id: Enum.random(1..10)
    }
  end

  def property_factory do
    name = ["Manufacturer", "Brand", "Model", "Shirt Type"] |> Enum.random()
    presentation = ["Nike", "Jordan", "Flight Team", "T-shirt"] |> Enum.random()

    %Property{
      name: name,
      presentation: presentation
    }
  end

  def taxonomy_factory do
    name = ["Shirts", "Pants", "Jackets", "Socks"] |> Enum.random()
    
    %Taxonomy{
      name: name,
      position: Enum.random(1..10)
    }
  end

  def promotion_category_factory do
    name = ["Weekly Sale", "Quarterly Sale", "Regular Discount", "Black Friday Sale"] |> Enum.random()
    code = Faker.Lorem.characters(4) |> to_string
    
    %PromotionCategory{
      name: name,
      code: code
    }
  end

  def promotion_factory do
    expires_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    starts_at = NaiveDateTime.new!(~D[2021-01-01], ~T[00:00:00])
                |> NaiveDateTime.to_string
    name = ["Weekly Sale", "Quarterly Sale", "Regular Discount", "Black Friday Sale"] |> Enum.random()
    type = ["one-time", "weekly"] |> Enum.random()
    match_policy = ["any", "all"] |> Enum.random()
    promotion_category = insert(:promotion_category)
    # code = insert(:promotion_code)
    
    %Promotion{
      description: Faker.Lorem.paragraph(),
      expires_at: expires_at,
      starts_at: starts_at,
      name: name,
      type: type,
      usage_limit: Enum.random(1..10),
      match_policy: match_policy,
      advertise: true,
      path: "#{name}/",
      promotion_category_id: promotion_category.id,
      per_code_usage_limit: 1,
      apply_automatically: true
    }
  end

  def promotion_code_factory do
    promotion = insert(:promotion)
    code = Faker.Lorem.characters(4) |> to_string
    
    %PromotionCode{
      promotion_id: promotion.id,
      value: code
    }
  end

  def adjustment_reason_factory do
    reason = ["price change", "transaction misfunction", "out of stock"] |> Enum.random()
    %AdjustmentReason{
      name: reason,
      code: reason,
      active: true
    }
  end

  def adjustment_factory do
    amount = FakerElixir.Number.decimal(2,2)
             |> Decimal.new
             |> Decimal.to_float
    order = ShoppingCart.Factory.insert(:order)
    promotion_code = insert(:promotion_code)
    adjustment_reason = insert(:adjustment_reason)
    
    %Adjustment{
      amount: amount,
      label: "generic adjustment",
      eligible: Enum.random([true, false]),
      order_id: order.id,
      promotion_code_id: promotion_code.id,
      adjustment_reason: adjustment_reason.id
    }
  end

  def refund_reason_factory do
    reason = ["bad product", "mispurchase", "out of stock"] |> Enum.random()
    code = Faker.Lorem.characters(4) |> to_string
    
    %RefundReason{
      name: reason,
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
      code: code
    }
  end

  def reimbursement_type_factory do
    reimbursement = ["refund", "complementary product"] |> Enum.random()
    type = ["refund", "gift"] |> Enum.random()
    
    %ReimbursementType{
      name: reimbursement,
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
      type: type
    }
  end

  def return_reason_factory do
    reason = ["bad product", "opened packaging", "not as requested"] |> Enum.random()

    %ReturnReason{
      name: reason,
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
    }
  end

  def shipping_category_factory do
    category = ["ground freight shipping", "air freight shipping", "ground postal shipping"] |> Enum.random()
    
    %ShippingCategory{
      name: category
    }
  end
end