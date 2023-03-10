defmodule InventoryRoom.Factory do
  use ExMachina.Ecto, repo: StoreRepo.Repo

  alias InventoryRoom.Inventory.StockItem

  alias InventoryRoom.Joins.{
    ProductOptionType,
    ProductProperty,
    ProductTaxon,
    ShippingMethodCategory,
    ShippingMethodStockLocation,
    ShippingMethodZone,
    StorePaymentMethod,
    VariantOptionValue,
    ZoneMember
  }

  alias InventoryRoom.Orders.Payment

  alias InventoryRoom.Products.{
    OptionType,
    OptionValue,
    Price,
    Property,
    Taxon,
    Taxonomy,
    Product,
    ProductImage,
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
    CustomerReturn,
    Refund,
    RefundReason,
    Reimbursement,
    ReimbursementType,
    ReturnAuthorization,
    ReturnReason
  }

  alias InventoryRoom.Settings.Shipping.{
    Shipment,
    ShippingCategory,
    ShippingMethod,
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

  def option_type_factory do
    option = ["size", "color", "style"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %OptionType{
      name: "product-#{option}-#{Enum.random(1..100)}",
      presentation: option,
      position: Enum.random(1..50),
      inserted_at: inserted_at,
      updated_at: inserted_at
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
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %OptionValue{
      position: Enum.random(1..50),
      name: value,
      presentation: presentation_map[value],
      option_type_id: option_type.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def price_factory do
    currency_code = ["USD", "EUR", "GBP"] |> Enum.random()
    country_iso = Countries.filter_by(:currency_code, currency_code) 
                  |> Enum.random() 
                  |> Map.get(:alpha2)
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    amount = odd_decimal(2,2)
    variant = insert(:variant)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %Price{
      amount: amount,
      currency: currency_code,
      deleted_at: deleted_at,
      is_default: false,
      country_iso: country_iso,
      variant_id: variant.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  # TODO: properties for the schema fields that need to
  #       use this helper function
  defp odd_decimal(left_digit, right_digit) do
    decimal = FakerElixir.Number.decimal(left_digit, right_digit)
    
    last_digit = decimal
    |> String.split("", trim: true) 
    |> List.last 

    if last_digit == "0" do
      odd_decimal(left_digit, right_digit)
    else
      decimal
      |> Decimal.new
      |> Decimal.to_float
    end
  end

  def property_factory do
    name = ["Manufacturer", "Brand", "Model", "Shirt Type"] |> Enum.random()
    presentation = ["Nike", "Jordan", "Flight Team", "T-shirt"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string  

    %Property{
      name: "#{name} - #{Enum.random(1..100)}",
      presentation: "#{presentation} - #{Enum.random(1..100)}",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def taxon_factory do
    name = ["Long-sleeve", "Short-sleeve", "Collared", "Polo"] |> Enum.random()
    taxonomy = insert(:taxonomy)
    product_image = insert(:product_image)
    icon_updated_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %Taxon{
      parent_id: Enum.random(1..10),
      position: Enum.random(1..10),
      name: name,
      permalink: "/#{name}",
      taxonomy_id: taxonomy.id,
      icon_file_name: product_image.file,
      icon_content_type: "image",
      icon_file_size: Enum.random(20..40),
      icon_updated_at: icon_updated_at,
      description: Faker.Lorem.paragraph(),
      meta_description: Faker.Lorem.paragraph(),
      meta_keywords: Faker.Lorem.sentence(10, ""),
      meta_title: String.capitalize(Faker.Lorem.word()),
      inserted_at: icon_updated_at,
      updated_at: icon_updated_at
    }
  end

  def taxonomy_factory do
    name = ["Shirts", "Pants", "Jackets", "Socks"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %Taxonomy{
      name: "#{name} - #{Enum.random(1..100)}",
      position: Enum.random(1..100),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def promotion_category_factory do
    name = ["Weekly Sale", "Quarterly Sale", "Regular Discount", "Black Friday Sale"] |> Enum.random()
    code = Faker.Lorem.characters(4) |> to_string
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %PromotionCategory{
      name: name,
      code: code,
      inserted_at: inserted_at,
      updated_at: inserted_at
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
      apply_automatically: true,
      inserted_at: expires_at,
      updated_at: expires_at
    }
  end

  def promotion_code_factory do
    promotion = insert(:promotion)
    code = Faker.Lorem.characters(4) |> to_string
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %PromotionCode{
      promotion_id: promotion.id,
      value: code,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def adjustment_reason_factory do
    reason = ["price change", "transaction misfunction", "out of stock"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %AdjustmentReason{
      name: reason,
      code: "#{reason} - #{Enum.random(1..100)}",
      active: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def adjustment_factory do
    amount = odd_decimal(2,2)
    order = ShoppingCart.Factory.insert(:order)
    promotion_code = insert(:promotion_code)
    adjustment_reason = insert(:adjustment_reason)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %Adjustment{
      amount: amount,
      label: "generic adjustment",
      eligible: Enum.random([true, false]),
      order_id: order.id,
      promotion_code_id: promotion_code.id,
      adjustment_reason_id: adjustment_reason.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def refund_reason_factory do
    reason = ["bad product", "mispurchase", "out of stock"] |> Enum.random()
    code = Faker.Lorem.characters(4) |> to_string
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %RefundReason{
      name: reason,
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
      code: code,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def reimbursement_type_factory do
    reimbursement = ["refund", "complementary product"] |> Enum.random()
    type = ["refund", "gift"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %ReimbursementType{
      name: "#{reimbursement} - #{Enum.random(1..100)}",
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
      type: type,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def return_reason_factory do
    reason = ["bad product", "opened packaging", "not as requested"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %ReturnReason{
      name: "#{reason} - #{Enum.random(1..100)}",
      active: Enum.random([true, false]),
      mutable: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipment_factory do
    cost = odd_decimal(2,2)
    adjustment_total = odd_decimal(2,2)
    promo_total = odd_decimal(2,2)
    additional_tax_total = odd_decimal(2,2)
    included_tax_total = odd_decimal(2,2)
    tracking = Faker.Lorem.characters(10) |> to_string
    shipped_at = NaiveDateTime.utc_now() |> NaiveDateTime.to_string()
    order = ShoppingCart.Factory.insert(:order)
    stock_location = insert(:stock_location)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %Shipment{
      tracking_number: tracking,
      cost: cost,
      shipped_at: shipped_at,
      state: "shipped",
      adjustment_total: adjustment_total,
      additional_tax_total: additional_tax_total,
      promo_total: promo_total,
      included_tax_total: included_tax_total,
      order_id: order.id,
      stock_location_id: stock_location.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipping_category_factory do
    category = ["ground freight shipping", "air freight shipping", "ground postal shipping"] |> Enum.random()
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %ShippingCategory{
      name: "#{category} - #{Enum.random(1..100)}",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipping_method_factory do
    shipping_method_id = Enum.random(1..10)
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    code = Faker.Lorem.characters(8) |> to_string
    tax_category = insert(:tax_category)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %ShippingMethod{
      name: "Shipping Method #{shipping_method_id}",
      display_on: "all",
      deleted_at: deleted_at,
      tracking_url: "/shipping_method/#{shipping_method_id}",
      internal_name: "Ground Shipping #{shipping_method_id}",
      code: code,
      available_to_all: Enum.random([true, false]),
      carrier: "Fedex",
      service_level: "Ground",
      tax_category_id: tax_category.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def credit_category_factory do
    category = ["store credit", "company credit", "brand credit"] 
               |> Enum.random
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
               |> NaiveDateTime.to_string
    
    %CreditCategory{
      name: "#{category} - #{Enum.random(1..100)}",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def credit_reason_factory do
    reason = ["reimbursement", "exclusive discount", "sale"]
             |> Enum.random
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %CreditReason{
      name: "#{reason} - #{Enum.random(1..100)}",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def credit_type_factory do
    type = ["one-time", "regular"] |> Enum.random
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %CreditType{
      name: "#{type} - #{Enum.random(1..100)}",
      priority: Enum.random(1..50),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def credit_factory do
    amount = odd_decimal(2,2)
    amount_used = odd_decimal(2,2)
    amount_authorized = odd_decimal(2,2)
    credit_category = insert(:credit_category)
    credit_type = insert(:credit_type)
    currency_code = ["USD", "EUR", "GBP"] |> Enum.random()
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    invalidated_at = NaiveDateTime.new!(~D[2021-12-31], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    user = ShoppingCart.Factory.insert(:user)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %Credit{
      amount: amount,
      amount_used: amount_used,
      amount_authorized: amount_authorized,
      currency: currency_code,
      memo: Faker.Lorem.paragraph(),
      deleted_at: deleted_at,
      invalidated_at: invalidated_at,
      user_id: user.id,
      credit_category_id: credit_category.id,
      credit_type_id: credit_type.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def tax_category_factory do
    category = ["VAT", "Flat Tax"] |> Enum.random
    tax_code = Faker.Lorem.characters(8) |> to_string
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %TaxCategory{
      name: category,
      description: Faker.Lorem.paragraph(),
      is_default: Enum.random([true, false]),
      tax_code: tax_code,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def tax_rate_factory do
    amount = odd_decimal(1,5)
    zone = insert(:zone)
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %TaxRate{
      amount: amount,
      zone_id: zone.id,
      included_in_price: Enum.random([true, false]),
      name: "VAT Sales Tax",
      show_rate_in_label: Enum.random([true, false]),
      deleted_at: deleted_at,
      inserted_at: deleted_at,
      updated_at: deleted_at
    }
  end

  def country_factory do
    country = Countries.filter_by(:continent, "North America") |> Enum.random() 
    country_name = country |> Map.get(:name)
    country_iso = country |> Map.get(:alpha2)
    country_iso3 = country |> Map.get(:alpha3)
    numcode = if is_integer(Map.get(country, :number)) do
                Map.get(country, :number)
              else
                country
                |> Map.get(:number) 
                |> String.to_integer
              end
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %Country{
      iso_name: country_name,
      iso: country_iso,
      iso3: country_iso3,
      name: country_name,
      numcode: numcode,
      states_required: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def state_factory do
    country_factory = insert(:country)
    country = country_factory          
              |> Map.get(:iso)
              |> Countries.get()
    state = case Countries.Subdivisions.all(country) do
                        [] ->
                          Countries.get("US") |> Countries.Subdivisions.all |> Enum.random
                        countries ->
                          countries |> Enum.random
                      end
    state_name = state |> Map.get(:name)
    state_id = state
               |> Map.get(:id)
               |> to_string
    state_abbr = if Integer.parse(state_id) == :error do
                   state_id
                 else
                   state_name
                 end
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %State{
      name: state_name,
      abbr: state_abbr,
      country_id: country_factory.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def zone_factory do
    name = ["North America", "EU Zone", "Caribbean"] |> Enum.random
    type = ["country-based", "state-based"] |> Enum.random
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    
    %Zone{
      name: name,
      description: Faker.Lorem.paragraph(),
      zone_members_count: Enum.random(3..30),
      type: type,
      default_tax: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def payment_method_factory do
    type = ["credit card", "bank transfer", "remittance"] |> Enum.random
    name = ["VISA", "MASTERCARD", "EFECTY", "BANK_REFERENCED"] |> Enum.random
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %PaymentMethod{
      type: type,
      name: name,
      description: Faker.Lorem.paragraph(),
      active: Enum.random([true, false]),
      available_to_users: Enum.random([true, false]),
      available_to_admin: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def store_factory do
    name = Faker.Commerce.product_name()
    slug = name
           |> String.downcase
           |> String.split
           |> Enum.join("_")
    currency_code = ["USD", "EUR", "GBP"] |> Enum.random()
    country_iso = Countries.filter_by(:currency_code, currency_code) 
                  |> Enum.random() 
                  |> Map.get(:alpha2)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %Store{
      name: "#{name} store",
      url: "https://www.#{slug}.com",
      meta_description: Faker.Lorem.paragraph(),
      meta_keywords: Faker.Lorem.sentence(10, ""),
      seo_title: String.capitalize(Faker.Lorem.word()),
      mail_from_address: Faker.Internet.email(),
      default_currency: "USD",
      currency: currency_code,
      default: Enum.random([true, false]),
      cart_tax_country_iso: country_iso,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def product_factory do
    name = Faker.Commerce.product_name()
    available_on = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                   |> NaiveDateTime.to_string
    discontinue_on = NaiveDateTime.utc_now |> NaiveDateTime.to_string
    master_sku_name = name
                 |> String.split
                 |> List.first
    shipping_category = insert(:shipping_category)
    tax_category = insert(:tax_category)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %Product{
      name: name,
      slug: "/#{name}",
      description: Faker.Lorem.paragraph(),
      meta_title: String.capitalize(Faker.Lorem.word()),
      meta_keywords: Faker.Lorem.sentence(10, ""),
      available_on: available_on,
      discontinue_on: discontinue_on,
      promotionable: Enum.random([true, false]),
      master_sku: "#{master_sku_name}",
      shipping_category_id: shipping_category.id,
      tax_category_id: tax_category.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def product_image_factory do
    product = insert(:product)
    image_id = Enum.random(1..10)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %ProductImage{
      product_id: product.id,
      alt_text: Faker.Lorem.sentence(5, ""),
      url: "#{product.slug}/images/#{image_id}",
      file: "#{product.name}_#{image_id}.jpg",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def variant_factory do
    product = insert(:product)
    size = odd_decimal(1,2)
    price = odd_decimal(2,2)
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    currency_code = ["USD", "EUR", "GBP"] |> Enum.random()
    tax_category = insert(:tax_category)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %Variant{
      sku: "#{product.master_sku}-00#{Enum.random(1..9)}",
      weight: size,
      height: size,
      width: size,
      depth: size,
      deleted_at: deleted_at,
      is_master: Enum.random([true, false]),
      product_id: product.id,
      cost_price: price,
      position: Enum.random(1..10),
      cost_currency: currency_code,
      track_inventory: Enum.random([true, false]),
      tax_category_id: tax_category.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def variant_image_factory do
    variant = insert(:variant)
    product = insert(:product)
    image_id = Enum.random(1..10)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %VariantImage{
      variant_id: variant.id,
      alt_text: Faker.Lorem.sentence(5, ""),
      url: "#{product.slug}/images/#{image_id}",
      file: "#{product.name}_#{image_id}.jpg",
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def stock_location_factory do
    location_id = Enum.random(1..10)
    code = Faker.Lorem.characters(4) |> to_string
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %StockLocation{
      name: "Stock Location #{location_id}",
      default: Enum.random([true, false]),
      address1: Faker.Address.street_address(),
      address2: Faker.Address.secondary_address(),
      city: Faker.Address.city(),
      zipcode: Faker.Address.zip(),
      phone: Faker.Phone.EnUs.phone(),
      active: Enum.random([true, false]),
      backorderable_default: Enum.random([true, false]),
      propagate_all_variants: Enum.random([true, false]),
      internal_name: "Warehouse #{location_id}",
      position: Enum.random(1..9),
      restock_inventory: Enum.random([true, false]),
      fulfillable: Enum.random([true, false]),
      code: code,
      check_stock_on_transfer: Enum.random([true, false]),
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def payment_factory do
    amount = odd_decimal(2,2)
    order = ShoppingCart.Factory.insert(:order)
    payment_method = insert(:payment_method)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %Payment{
      amount: amount,
      state: "paid",
      response_code: "200",
      avs_response: "cvv success",
      number: "1",
      cvv_response_code: "200",
      cvv_response_message: "payment successfully made",
      order_id: order.id,
      payment_method_id: payment_method.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def return_authorization_factory do
    order = ShoppingCart.Factory.insert(:order)
    stock_location = insert(:stock_location)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %ReturnAuthorization{
      number: to_string(Enum.random(200..1000)),
      state: "returned",
      memo: Faker.Lorem.paragraph(),
      order_id: order.id,
      stock_location_id: stock_location.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def customer_return_factory do
    stock_location = insert(:stock_location)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %CustomerReturn{
      number: to_string(Enum.random(200..1000)),
      stock_location_id: stock_location.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def reimbursement_factory do
    customer_return = insert(:customer_return)
    order = ShoppingCart.Factory.insert(:order)
    total = odd_decimal(2,2)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string

    %Reimbursement{
      number: to_string(Enum.random(200..1000)),
      reimbursement_status: "reimbursed",
      total: total,
      customer_return_id: customer_return.id,
      order_id: order.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def refund_factory do
    amount = odd_decimal(2,2)
    payment = insert(:payment)
    refund_reason = insert(:refund_reason)
    reimbursement = insert(:reimbursement)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                  |> NaiveDateTime.to_string
    
    %Refund{
      amount: amount,
      payment_id: payment.id,
      refund_reason_id: refund_reason.id,
      reimbursement_id: reimbursement.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def stock_item_factory do
    deleted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string
    stock_location = insert(:stock_location)
    variant = insert(:variant)
    
    %StockItem{
      count_on_hand: Enum.random(10..300),
      backorderable: Enum.random([true, false]),
      deleted_at: deleted_at,
      stock_location_id: stock_location.id,
      variant_id: variant.id,
      inserted_at: deleted_at,
      updated_at: deleted_at
    }
  end

  def product_option_type_factory do
    product = insert(:product)
    option_type = insert(:option_type)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ProductOptionType{
      product_id: product.id,
      option_type_id: option_type.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def product_property_factory do
    product = insert(:product)
    property = insert(:property)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ProductProperty{
      product_id: product.id,
      property_id: property.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def product_taxon_factory do
    product = insert(:product)
    taxon = insert(:taxon)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ProductTaxon{
      product_id: product.id,
      taxon_id: taxon.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipping_method_category_factory do
    shipping_method = insert(:shipping_method)
    shipping_category = insert(:shipping_category)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ShippingMethodCategory{
      shipping_method_id: shipping_method.id,
      shipping_category_id: shipping_category.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipping_method_stock_location_factory do
    shipping_method = insert(:shipping_method)
    stock_location = insert(:stock_location)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ShippingMethodStockLocation{
      shipping_method_id: shipping_method.id,
      stock_location_id: stock_location.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def shipping_method_zone_factory do
    shipping_method = insert(:shipping_method)
    zone = insert(:zone)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ShippingMethodZone{
      shipping_method_id: shipping_method.id,
      zone_id: zone.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def store_payment_method_factory do
    store = insert(:store)
    payment_method = insert(:payment_method)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %StorePaymentMethod{
      store_id: store.id,
      payment_method_id: payment_method.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def variant_option_value_factory do
    variant = insert(:variant)
    option_value = insert(:option_value)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %VariantOptionValue{
      variant_id: variant.id,
      option_value_id: option_value.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end

  def zone_member_factory do
    zone = insert(:zone)
    state = insert(:state)
    country = insert(:country)
    inserted_at = NaiveDateTime.new!(~D[2022-01-01], ~T[00:00:00])
                 |> NaiveDateTime.to_string

    %ZoneMember{
      zone_id: zone.id,
      state_id: state.id,
      country_id: country.id,
      inserted_at: inserted_at,
      updated_at: inserted_at
    }
  end
end