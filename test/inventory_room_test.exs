# defmodule InventoryRoomTest do
#   use InventoryRoom.DataCase, async: true
#   alias Ecto.Changeset
#   # alias ShoppingCart.Schemas.Cart
#   import InventoryRoom
#   import InventoryRoom.Factory
#   # import ShoppingCart.Query
# 	alias StoreRepo.Repo
#   # alias InventoryRoom.Inventory.StockItem
#   # alias InventoryRoom.Orders.Payment

#   # alias InventoryRoom.Products.{
#   #   OptionType,
#   #   OptionValue,
#   #   Price,
#   #   Property,
#   #   Taxon,
#   #   Taxonomy,
#   #   Product,
#   #   ProductImage,
#   #   Variant,
#   #   VariantImage
#   # }

#   # alias InventoryRoom.Promotions.{
#   #   PromotionCategory,
#   #   PromotionCode,
#   #   Promotion
#   # }

#   # alias InventoryRoom.Settings.RefundsAndReturns.{
#   #   AdjustmentReason,
#   #   Adjustment,
#   #   CustomerReturn,
#   #   RefundReason,
#   #   Refund,
#   #   ReimbursementType,
#   #   Reimbursement,
#   #   ReturnAuthorization,
#   #   ReturnReason
#   # }

#   # alias InventoryRoom.Settings.Shipping.{
#   #   Shipment,
#   #   ShippingCategory,
#   #   ShippingMethod,
#   #   StockLocation
#   # }

#   # alias InventoryRoom.Settings.StoreCredits.{
#   #   CreditCategory,
#   #   CreditReason,
#   #   CreditType,
#   #   Credit
#   # }

#   # alias InventoryRoom.Settings.{
#   #   PaymentMethod,
#   #   Store
#   # }

#   # alias InventoryRoom.Settings.Taxes.{
#   #   TaxCategory,
#   #   TaxRate
#   # }

#   # alias InventoryRoom.Settings.Zones.{
#   #   Country,
#   #   State,
#   #   Zone
#   # }

#   # #####################
#   # # Inventory Context #
#   # #####################

#   # # Create
#   # describe "create_stock_item/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:stock_item)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %StockItem{} = returned_schema} = 
#   #       create_stock_item(params)

#   #     schema_from_db = Repo.get(StockItem, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_stock_item_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_stock_item(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_stock_item/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:stock_item)

#   #     assert %StockItem{} = returned_schema = get_stock_item(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_stock_item(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_stock_item/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:stock_item)

#   #     params = string_params_for(:stock_item)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %StockItem{} = returned_schema} = update_stock_item(existing_schema, params)

#   #     schema_from_db = Repo.get(StockItem, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:stock_item)

#   #     bad_params = bad_stock_item_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_stock_item(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(StockItem, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_stock_item/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:stock_item)

#   #     assert {:ok, _deleted_schema} = delete_stock_item(schema)

#   #     refute Repo.get(StockItem, schema.id)
#   #   end
#   # end

#   # ##################
#   # # Orders Context #
#   # ##################

#   # # Create
#   # describe "create_payment/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:payment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Payment{} = returned_schema} = 
#   #       create_payment(params)

#   #     schema_from_db = Repo.get(Payment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_payment_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_payment(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_payment/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:payment)

#   #     assert %Payment{} = returned_schema = get_payment(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_payment(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_orders_by_user/1" do
# 	# 	test "success: it returns all orders when given a user" do
# 	# 		user = ShoppingCart.Factory.insert(:user)
#   #     cart1 = ShoppingCart.Factory.insert(:cart)
#   #     cart2 = ShoppingCart.Factory.insert(:cart)
#   #     cart3 = ShoppingCart.Factory.insert(:cart)

#   #     update_cart_user_id(cart1, user)
#   #     update_cart_user_id(cart2, user)
#   #     update_cart_user_id(cart3, user)

#   #     cart1 = Repo.get(cart_with_order(), cart1.id)
#   #     cart2 = Repo.get(cart_with_order(), cart2.id)
#   #     cart3 = Repo.get(cart_with_order(), cart3.id)

#   #     assert cart1.user_id == user.id
#   #     assert cart2.user_id == user.id
#   #     assert cart3.user_id == user.id

#   #     assert Enum.sort(get_orders_by_user(user)) == Enum.sort([cart1.order, cart2.order, cart3.order])
# 	# 	end

# 	# 	test "error: it returns nil when there are no orders associated with a user" do
#   #     user = ShoppingCart.Factory.insert(:user)

#   #     assert get_orders_by_user(user) == nil
#   #   end
# 	# end

#   # defp update_cart_user_id(cart, user) do
#   #   changeset = Cart.changeset(cart, %{user_id: user.id})
#   #   Repo.update(changeset)
#   # end

# 	# describe "get_orders_by_date/1" do
# 	# 	test "success: it returns all orders with matching inserted_at value when given a naive datetime" do
# 	# 		order1 = ShoppingCart.Factory.insert(:order)
# 	# 		order2 = ShoppingCart.Factory.insert(:order)
			
# 	# 		assert get_orders_by_date(NaiveDateTime.utc_now()) == [order1, order2]
# 	# 	end

# 	# 	test "error: it returns nil when there are no orders with a matching inserted_at value" do
# 	# 		order1 = ShoppingCart.Factory.insert(:order)
# 	# 		order2 = ShoppingCart.Factory.insert(:order)
# 	# 		datetime = NaiveDateTime.new!(2021, 1, 1, 0, 0, 0)
			
# 	# 		assert get_orders_by_date(datetime) == nil
# 	# 		refute get_orders_by_date(datetime) == [order1, order2]
# 	# 	end
# 	# end

# 	# describe "get_orders_by_payment_method/1" do
#   #   test "success: it returns all orders with a payment_method value that matches the given payment method" do
#   #     order1 = ShoppingCart.Factory.insert(:static_value_order)
#   #     order2 = ShoppingCart.Factory.insert(:static_value_order)
#   #     order3 = ShoppingCart.Factory.insert(:static_value_order)

#   #     assert get_orders_by_payment_method(order1.payment_method) == [order1, order2, order3]
#   #   end

#   #   test "error: it returns nil where there are no orders witih a matching payment_method value" do
#   #     ShoppingCart.Factory.insert(:static_value_order)
#   #     ShoppingCart.Factory.insert(:static_value_order)
#   #     ShoppingCart.Factory.insert(:static_value_order)

#   #     assert get_orders_by_payment_method("EFECTY") == nil
#   #   end
#   # end

#   # describe "get_orders_by_payment_country/1" do
#   #   test "success: it returns all orders with a payment_country value that matches the given country code" do
#   #     order1 = ShoppingCart.Factory.insert(:static_value_order)
#   #     order2 = ShoppingCart.Factory.insert(:static_value_order)
#   #     order3 = ShoppingCart.Factory.insert(:static_value_order)

#   #     assert get_orders_by_payment_country(order1.payment_country) == [order1, order2, order3]
#   #   end

#   #   test "error: it returns nil where there are no orders witih a matching payment_country value" do
#   #     ShoppingCart.Factory.insert(:static_value_order)
#   #     ShoppingCart.Factory.insert(:static_value_order)
#   #     ShoppingCart.Factory.insert(:static_value_order)

#   #     assert get_orders_by_payment_country("US") == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_payment/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:payment)

#   #     params = string_params_for(:payment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Payment{} = returned_schema} = update_payment(existing_schema, params)

#   #     schema_from_db = Repo.get(Payment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:payment)

#   #     bad_params = bad_payment_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_payment(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Payment, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_payment/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:payment)

#   #     assert {:ok, _deleted_schema} = delete_payment(schema)

#   #     refute Repo.get(Payment, schema.id)
#   #   end
#   # end

#   # ####################
#   # # Products Context #
#   # ####################

#   # # Create
#   # describe "create_option_type/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:option_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %OptionType{} = returned_schema} = 
#   #       create_option_type(params)

#   #     schema_from_db = Repo.get(OptionType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_option_type_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_option_type(bad_params)
#   #   end
#   # end

#   # describe "create_option_value/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:option_value)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %OptionValue{} = returned_schema} = 
#   #       create_option_value(params)

#   #     schema_from_db = Repo.get(OptionValue, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_option_value_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_option_value(bad_params)
#   #   end
#   # end

#   # describe "create_price/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:price)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Price{} = returned_schema} = 
#   #       create_price(params)

#   #     schema_from_db = Repo.get(Price, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         :deleted_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_price_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_price(bad_params)
#   #   end
#   # end

#   # describe "create_property/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:property)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Property{} = returned_schema} = 
#   #       create_property(params)

#   #     schema_from_db = Repo.get(Property, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_property_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_property(bad_params)
#   #   end
#   # end

#   # describe "create_taxon/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:taxon)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Taxon{} = returned_schema} = 
#   #       create_taxon(params)

#   #     schema_from_db = Repo.get(Taxon, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :icon_updated_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_taxon_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_taxon(bad_params)
#   #   end
#   # end

#   # describe "create_taxonomy/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:taxonomy)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Taxonomy{} = returned_schema} = 
#   #       create_taxonomy(params)

#   #     schema_from_db = Repo.get(Taxonomy, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_taxonomy_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_taxonomy(bad_params)
#   #   end
#   # end

#   # describe "create_product/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:product)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Product{} = returned_schema} = 
#   #       create_product(params)

#   #     schema_from_db = Repo.get(Product, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :available_on ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         :discontinue_on ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_product_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_product(bad_params)
#   #   end
#   # end

#   # describe "create_product_image/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:product_image)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ProductImage{} = returned_schema} = 
#   #       create_product_image(params)

#   #     schema_from_db = Repo.get(ProductImage, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_product_image_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_product_image(bad_params)
#   #   end
#   # end

#   # describe "create_variant/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:variant)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Variant{} = returned_schema} = 
#   #       create_variant(params)

#   #     schema_from_db = Repo.get(Variant, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Variant.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Variant.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_variant_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_variant(bad_params)
#   #   end
#   # end

#   # describe "create_variant_image/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:variant_image)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %VariantImage{} = returned_schema} = 
#   #       create_variant_image(params)

#   #     schema_from_db = Repo.get(VariantImage, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_variant_image_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_variant_image(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_option_type/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:option_type)

#   #     assert %OptionType{} = returned_schema = get_option_type(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_option_type(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_option_value/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:option_value)

#   #     assert %OptionValue{} = returned_schema = get_option_value(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_option_value(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_price/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:price)

#   #     assert %Price{} = returned_schema = get_price(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_price(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_property/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:property)

#   #     assert %Property{} = returned_schema = get_property(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_property(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_taxon/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:taxon)

#   #     assert %Taxon{} = returned_schema = get_taxon(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_taxon(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_taxonomy/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:taxonomy)

#   #     assert %Taxonomy{} = returned_schema = get_taxonomy(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_taxonomy(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_product/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:product)

#   #     assert %Product{} = returned_schema = get_product(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_product(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_product_image/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:product_image)

#   #     assert %ProductImage{} = returned_schema = get_product_image(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_product_image(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_variant/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:variant)

#   #     assert %Variant{} = returned_schema = get_variant(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_variant(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_variant_image/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:variant_image)

#   #     assert %VariantImage{} = returned_schema = get_variant_image(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_variant_image(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_option_type/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:option_type)

#   #     params = string_params_for(:option_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %OptionType{} = returned_schema} = update_option_type(existing_schema, params)

#   #     schema_from_db = Repo.get(OptionType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:option_type)

#   #     bad_params = bad_option_type_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_option_type(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(OptionType, existing_schema.id)
#   #   end
#   # end

#   # describe "update_option_value/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:option_value)

#   #     params = string_params_for(:option_value)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %OptionValue{} = returned_schema} = update_option_value(existing_schema, params)

#   #     schema_from_db = Repo.get(OptionValue, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:option_value)

#   #     bad_params = bad_option_value_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_option_value(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(OptionValue, existing_schema.id)
#   #   end
#   # end

#   # describe "update_price/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:price)

#   #     params = string_params_for(:price)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Price{} = returned_schema} = update_price(existing_schema, params)

#   #     schema_from_db = Repo.get(Price, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       case field do
#   #       :amount ->
#   #         assert expected == actual |> Decimal.to_float()
#   #       :deleted_at ->
#   #         assert expected == actual |> NaiveDateTime.to_string()
#   #       _ ->
#   #         assert actual == expected,
#   #           "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:price)

#   #     bad_params = bad_price_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_price(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Price, existing_schema.id)
#   #   end
#   # end

#   # describe "update_property/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:property)

#   #     params = string_params_for(:property)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Property{} = returned_schema} = update_property(existing_schema, params)

#   #     schema_from_db = Repo.get(Property, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:property)

#   #     bad_params = bad_property_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_property(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Property, existing_schema.id)
#   #   end
#   # end

#   # describe "update_taxon/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:taxon)

#   #     params = string_params_for(:taxon)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Taxon{} = returned_schema} = update_taxon(existing_schema, params)

#   #     schema_from_db = Repo.get(Taxon, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       case field do
#   #       :icon_updated_at ->
#   #         assert expected == actual |> NaiveDateTime.to_string()
#   #       _ ->
#   #         assert actual == expected,
#   #           "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:taxon)

#   #     bad_params = bad_taxon_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_taxon(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Taxon, existing_schema.id)
#   #   end
#   # end

#   # describe "update_taxonomy/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:taxonomy)

#   #     params = string_params_for(:taxonomy)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Taxonomy{} = returned_schema} = update_taxonomy(existing_schema, params)

#   #     schema_from_db = Repo.get(Taxonomy, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       case field do
#   #       :icon_updated_at ->
#   #         assert expected == actual |> NaiveDateTime.to_string()
#   #       _ ->
#   #         assert actual == expected,
#   #           "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:taxonomy)

#   #     bad_params = bad_taxonomy_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_taxonomy(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Taxonomy, existing_schema.id)
#   #   end
#   # end

#   # describe "update_product/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:product)

#   #     params = string_params_for(:product)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Product{} = returned_schema} = update_product(existing_schema, params)

#   #     schema_from_db = Repo.get(Product, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       case field do
#   #         :available_on ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         :discontinue_on ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end 
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:product)

#   #     bad_params = bad_product_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_product(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Product, existing_schema.id)
#   #   end
#   # end

#   # describe "update_product_image/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:product_image)

#   #     params = string_params_for(:product_image)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ProductImage{} = returned_schema} = update_product_image(existing_schema, params)

#   #     schema_from_db = Repo.get(ProductImage, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:product_image)

#   #     bad_params = bad_product_image_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_product_image(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ProductImage, existing_schema.id)
#   #   end
#   # end

#   # describe "update_variant/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:variant)

#   #     params = string_params_for(:variant)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Variant{} = returned_schema} = update_variant(existing_schema, params)

#   #     schema_from_db = Repo.get(Variant, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #         field not in Variant.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Variant.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:variant)

#   #     bad_params = bad_variant_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_variant(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Variant, existing_schema.id)
#   #   end
#   # end

#   # describe "update_variant_image/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:variant_image)

#   #     params = string_params_for(:variant_image)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %VariantImage{} = returned_schema} = update_variant_image(existing_schema, params)

#   #     schema_from_db = Repo.get(VariantImage, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:variant_image)

#   #     bad_params = bad_variant_image_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_variant_image(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(VariantImage, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_option_type/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:option_type)

#   #     assert {:ok, _deleted_schema} = delete_option_type(schema)

#   #     refute Repo.get(OptionType, schema.id)
#   #   end
#   # end

#   # describe "delete_option_value/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:option_value)

#   #     assert {:ok, _deleted_schema} = delete_option_value(schema)

#   #     refute Repo.get(OptionValue, schema.id)
#   #   end
#   # end

#   # describe "delete_price/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:price)

#   #     assert {:ok, _deleted_schema} = delete_price(schema)

#   #     refute Repo.get(Price, schema.id)
#   #   end
#   # end

#   # describe "delete_property/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:property)

#   #     assert {:ok, _deleted_schema} = delete_property(schema)

#   #     refute Repo.get(Property, schema.id)
#   #   end
#   # end

#   # describe "delete_taxon/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:taxon)

#   #     assert {:ok, _deleted_schema} = delete_taxon(schema)

#   #     refute Repo.get(Taxon, schema.id)
#   #   end
#   # end

#   # describe "delete_taxonomy/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:taxonomy)

#   #     assert {:ok, _deleted_schema} = delete_taxonomy(schema)

#   #     refute Repo.get(Taxonomy, schema.id)
#   #   end
#   # end

#   # describe "delete_product/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:product)

#   #     assert {:ok, _deleted_schema} = delete_product(schema)

#   #     refute Repo.get(Product, schema.id)
#   #   end
#   # end

#   # describe "delete_product_image/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:product_image)

#   #     assert {:ok, _deleted_schema} = delete_product_image(schema)

#   #     refute Repo.get(ProductImage, schema.id)
#   #   end
#   # end

#   # describe "delete_variant/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:variant)

#   #     assert {:ok, _deleted_schema} = delete_variant(schema)

#   #     refute Repo.get(Variant, schema.id)
#   #   end
#   # end

#   # describe "delete_variant_image/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:variant_image)

#   #     assert {:ok, _deleted_schema} = delete_variant_image(schema)

#   #     refute Repo.get(VariantImage, schema.id)
#   #   end
#   # end

#   # ######################
#   # # Promotions Context #
#   # ######################

#   # # Create
#   # describe "create_promotion_category/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:promotion_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PromotionCategory{} = returned_schema} = 
#   #       create_promotion_category(params)

#   #     schema_from_db = Repo.get(PromotionCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_promotion_category_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_promotion_category(bad_params)
#   #   end
#   # end

#   # describe "create_promotion_code/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:promotion_code)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PromotionCode{} = returned_schema} = 
#   #       create_promotion_code(params)

#   #     schema_from_db = Repo.get(PromotionCode, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_promotion_code_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_promotion_code(bad_params)
#   #   end
#   # end

#   # describe "create_promotion/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:promotion)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Promotion{} = returned_schema} = 
#   #       create_promotion(params)

#   #     schema_from_db = Repo.get(Promotion, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Promotion.date_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Promotion.date_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> NaiveDateTime.to_string()      
#   #     end
      
#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_promotion_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_promotion(bad_params)
#   #   end
#   # end


#   # # Read
#   # describe "get_promotion_category/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:promotion_category)

#   #     assert %PromotionCategory{} = returned_schema = get_promotion_category(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_promotion_category(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_promotion_code/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:promotion_code)

#   #     assert %PromotionCode{} = returned_schema = get_promotion_code(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_promotion_code(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_promotion/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:promotion)

#   #     assert %Promotion{} = returned_schema = get_promotion(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_promotion(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_promotion_category/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:promotion_category)

#   #     params = string_params_for(:promotion_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PromotionCategory{} = returned_schema} = update_promotion_category(existing_schema, params)

#   #     schema_from_db = Repo.get(PromotionCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:promotion_category)

#   #     bad_params = bad_promotion_category_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_promotion_category(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(PromotionCategory, existing_schema.id)
#   #   end
#   # end

#   # describe "update_promotion_code/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:promotion_code)

#   #     params = string_params_for(:promotion_code)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PromotionCode{} = returned_schema} = update_promotion_code(existing_schema, params)

#   #     schema_from_db = Repo.get(PromotionCode, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:promotion_code)

#   #     bad_params = bad_promotion_code_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_promotion_code(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(PromotionCode, existing_schema.id)
#   #   end
#   # end

#   # describe "update_promotion/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:promotion)

#   #     params = string_params_for(:promotion)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Promotion{} = returned_schema} = update_promotion(existing_schema, params)

#   #     schema_from_db = Repo.get(Promotion, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Promotion.date_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Promotion.date_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> NaiveDateTime.to_string()      
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:promotion)

#   #     bad_params = bad_promotion_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_promotion(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Promotion, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_promotion_category/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:promotion_category)

#   #     assert {:ok, _deleted_schema} = delete_promotion_category(schema)

#   #     refute Repo.get(PromotionCategory, schema.id)
#   #   end
#   # end

#   # describe "delete_promotion_code/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:promotion_code)

#   #     assert {:ok, _deleted_schema} = delete_promotion_code(schema)

#   #     refute Repo.get(PromotionCode, schema.id)
#   #   end
#   # end

#   # describe "delete_promotion/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:promotion)

#   #     assert {:ok, _deleted_schema} = delete_promotion(schema)

#   #     refute Repo.get(Promotion, schema.id)
#   #   end
#   # end

#   # ###############################
#   # # Refunds and Returns Context #
#   # ###############################

#   # # Create
#   # describe "create_adjustment_reason/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:adjustment_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %AdjustmentReason{} = returned_schema} = 
#   #       create_adjustment_reason(params)

#   #     schema_from_db = Repo.get(AdjustmentReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_adjustment_reason_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_adjustment_reason(bad_params)
#   #   end
#   # end

#   # describe "create_adjustment/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:adjustment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Adjustment{} = returned_schema} = 
#   #       create_adjustment(params)

#   #     schema_from_db = Repo.get(Adjustment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_adjustment_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_adjustment(bad_params)
#   #   end
#   # end
  
#   # describe "create_customer_return/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:customer_return)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CustomerReturn{} = returned_schema} = 
#   #       create_customer_return(params)

#   #     schema_from_db = Repo.get(CustomerReturn, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_customer_return_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_customer_return(bad_params)
#   #   end
#   # end

#   # describe "create_refund_reason/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:refund_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %RefundReason{} = returned_schema} = 
#   #       create_refund_reason(params)

#   #     schema_from_db = Repo.get(RefundReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_refund_reason_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_refund_reason(bad_params)
#   #   end
#   # end

#   # describe "create_refund/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:refund)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Refund{} = returned_schema} = 
#   #       create_refund(params)

#   #     schema_from_db = Repo.get(Refund, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_refund_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_refund(bad_params)
#   #   end
#   # end

#   # describe "create_reimbursement_type/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:reimbursement_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReimbursementType{} = returned_schema} = 
#   #       create_reimbursement_type(params)

#   #     schema_from_db = Repo.get(ReimbursementType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_reimbursement_type_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_reimbursement_type(bad_params)
#   #   end
#   # end

#   # describe "create_reimbursement/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:reimbursement)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Reimbursement{} = returned_schema} = 
#   #       create_reimbursement(params)

#   #     schema_from_db = Repo.get(Reimbursement, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :total ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_reimbursement_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_reimbursement(bad_params)
#   #   end
#   # end

#   # describe "create_return_authorization/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:return_authorization)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReturnAuthorization{} = returned_schema} = 
#   #       create_return_authorization(params)

#   #     schema_from_db = Repo.get(ReturnAuthorization, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_return_authorization_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_return_authorization(bad_params)
#   #   end
#   # end

#   # describe "create_return_reason/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:return_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReturnReason{} = returned_schema} = 
#   #       create_return_reason(params)

#   #     schema_from_db = Repo.get(ReturnReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_return_reason_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_return_reason(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_adjustment_reason/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:adjustment_reason)

#   #     assert %AdjustmentReason{} = returned_schema = get_adjustment_reason(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_adjustment_reason(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_adjustment/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:adjustment)

#   #     assert %Adjustment{} = returned_schema = get_adjustment(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_adjustment(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_customer_return/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:customer_return)

#   #     assert %CustomerReturn{} = returned_schema = get_customer_return(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_customer_return(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_refund_reason/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:refund_reason)

#   #     assert %RefundReason{} = returned_schema = get_refund_reason(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_refund_reason(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_refund/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:refund)

#   #     assert %Refund{} = returned_schema = get_refund(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_refund(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_reimbursement_type/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:reimbursement_type)

#   #     assert %ReimbursementType{} = returned_schema = get_reimbursement_type(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_reimbursement_type(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_reimbursement/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:reimbursement)

#   #     assert %Reimbursement{} = returned_schema = get_reimbursement(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_reimbursement(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_return_authorization/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:return_authorization)

#   #     assert %ReturnAuthorization{} = returned_schema = get_return_authorization(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_return_authorization(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_return_reason/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:return_reason)

#   #     assert %ReturnReason{} = returned_schema = get_return_reason(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_return_reason(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_adjustment_reason/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:adjustment_reason)

#   #     params = string_params_for(:adjustment_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %AdjustmentReason{} = returned_schema} = update_adjustment_reason(existing_schema, params)

#   #     schema_from_db = Repo.get(AdjustmentReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:adjustment_reason)

#   #     bad_params = bad_adjustment_reason_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_adjustment_reason(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(AdjustmentReason, existing_schema.id)
#   #   end
#   # end

#   # describe "update_adjustment/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:adjustment)

#   #     params = string_params_for(:adjustment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Adjustment{} = returned_schema} = update_adjustment(existing_schema, params)

#   #     schema_from_db = Repo.get(Adjustment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:adjustment)

#   #     bad_params = bad_adjustment_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_adjustment(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Adjustment, existing_schema.id)
#   #   end
#   # end

#   # describe "update_customer_return/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:customer_return)

#   #     params = string_params_for(:customer_return)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CustomerReturn{} = returned_schema} = update_customer_return(existing_schema, params)

#   #     schema_from_db = Repo.get(CustomerReturn, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:customer_return)

#   #     bad_params = bad_customer_return_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_customer_return(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(CustomerReturn, existing_schema.id)
#   #   end
#   # end

#   # describe "update_refund_reason/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:refund_reason)

#   #     params = string_params_for(:refund_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %RefundReason{} = returned_schema} = update_refund_reason(existing_schema, params)

#   #     schema_from_db = Repo.get(RefundReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:refund_reason)

#   #     bad_params = bad_refund_reason_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_refund_reason(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(RefundReason, existing_schema.id)
#   #   end
#   # end

#   # describe "update_refund/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:refund)

#   #     params = string_params_for(:refund)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Refund{} = returned_schema} = update_refund(existing_schema, params)

#   #     schema_from_db = Repo.get(Refund, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:refund)

#   #     bad_params = bad_refund_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_refund(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Refund, existing_schema.id)
#   #   end
#   # end

#   # describe "update_reimbursement_type/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:reimbursement_type)

#   #     params = string_params_for(:reimbursement_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReimbursementType{} = returned_schema} = update_reimbursement_type(existing_schema, params)

#   #     schema_from_db = Repo.get(ReimbursementType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:reimbursement_type)

#   #     bad_params = bad_reimbursement_type_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_reimbursement_type(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ReimbursementType, existing_schema.id)
#   #   end
#   # end

#   # describe "update_reimbursement/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:reimbursement)

#   #     params = string_params_for(:reimbursement)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Reimbursement{} = returned_schema} = update_reimbursement(existing_schema, params)

#   #     schema_from_db = Repo.get(Reimbursement, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :total ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:reimbursement)

#   #     bad_params = bad_reimbursement_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_reimbursement(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Reimbursement, existing_schema.id)
#   #   end
#   # end

#   # describe "update_return_authorization/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:return_authorization)

#   #     params = string_params_for(:return_authorization)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReturnAuthorization{} = returned_schema} = update_return_authorization(existing_schema, params)

#   #     schema_from_db = Repo.get(ReturnAuthorization, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:return_authorization)

#   #     bad_params = bad_return_authorization_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_return_authorization(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ReturnAuthorization, existing_schema.id)
#   #   end
#   # end

#   # describe "update_return_reason/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:return_reason)

#   #     params = string_params_for(:return_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ReturnReason{} = returned_schema} = update_return_reason(existing_schema, params)

#   #     schema_from_db = Repo.get(ReturnReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:return_reason)

#   #     bad_params = bad_return_reason_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_return_reason(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ReturnReason, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_adjustment_reason/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:adjustment_reason)

#   #     assert {:ok, _deleted_schema} = delete_adjustment_reason(schema)

#   #     refute Repo.get(AdjustmentReason, schema.id)
#   #   end
#   # end

#   # describe "delete_adjustment/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:adjustment)

#   #     assert {:ok, _deleted_schema} = delete_adjustment(schema)

#   #     refute Repo.get(Adjustment, schema.id)
#   #   end
#   # end

#   # describe "delete_customer_return/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:customer_return)

#   #     assert {:ok, _deleted_schema} = delete_customer_return(schema)

#   #     refute Repo.get(CustomerReturn, schema.id)
#   #   end
#   # end

#   # describe "delete_refund_reason/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:refund_reason)

#   #     assert {:ok, _deleted_schema} = delete_refund_reason(schema)

#   #     refute Repo.get(RefundReason, schema.id)
#   #   end
#   # end

#   # describe "delete_refund/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:refund)

#   #     assert {:ok, _deleted_schema} = delete_refund(schema)

#   #     refute Repo.get(Refund, schema.id)
#   #   end
#   # end

#   # describe "delete_reimbursement_type/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:reimbursement_type)

#   #     assert {:ok, _deleted_schema} = delete_reimbursement_type(schema)

#   #     refute Repo.get(ReimbursementType, schema.id)
#   #   end
#   # end

#   # describe "delete_reimbursement/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:reimbursement)

#   #     assert {:ok, _deleted_schema} = delete_reimbursement(schema)

#   #     refute Repo.get(Reimbursement, schema.id)
#   #   end
#   # end

#   # describe "delete_return_authorization/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:return_authorization)

#   #     assert {:ok, _deleted_schema} = delete_return_authorization(schema)

#   #     refute Repo.get(ReturnAuthorization, schema.id)
#   #   end
#   # end

#   # describe "delete_return_reason/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:return_reason)

#   #     assert {:ok, _deleted_schema} = delete_return_reason(schema)

#   #     refute Repo.get(ReturnReason, schema.id)
#   #   end
#   # end

#   # ####################
#   # # Shipping Context #
#   # ####################

#   # # Create
#   # describe "create_shipment/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:shipment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Shipment{} = returned_schema} = 
#   #       create_shipment(params)

#   #     schema_from_db = Repo.get(Shipment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Shipment.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :shipped_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Shipment.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_shipment_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_shipment(bad_params)
#   #   end
#   # end

#   # describe "create_shipping_category/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:shipping_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ShippingCategory{} = returned_schema} = 
#   #       create_shipping_category(params)

#   #     schema_from_db = Repo.get(ShippingCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_shipping_category_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_shipping_category(bad_params)
#   #   end
#   # end

#   # describe "create_shipping_method/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:shipping_method)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ShippingMethod{} = returned_schema} = 
#   #       create_shipping_method(params)

#   #     schema_from_db = Repo.get(ShippingMethod, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end
      
#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_shipping_method_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_shipping_method(bad_params)
#   #   end
#   # end

#   # describe "create_stock_location/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:stock_location)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %StockLocation{} = returned_schema} = 
#   #       create_stock_location(params)

#   #     schema_from_db = Repo.get(StockLocation, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_stock_location_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_stock_location(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_shipment/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:shipment)

#   #     assert %Shipment{} = returned_schema = get_shipment(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_shipment(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_shipping_category/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:shipping_category)

#   #     assert %ShippingCategory{} = returned_schema = get_shipping_category(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_shipping_category(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_shipping_method/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:shipping_method)

#   #     assert %ShippingMethod{} = returned_schema = get_shipping_method(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_shipping_method(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_stock_location/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:stock_location)

#   #     assert %StockLocation{} = returned_schema = get_stock_location(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_stock_location(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_shipment/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:shipment)

#   #     params = string_params_for(:shipment)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Shipment{} = returned_schema} = update_shipment(existing_schema, params)

#   #     schema_from_db = Repo.get(Shipment, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Shipment.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :shipped_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Shipment.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:shipment)

#   #     bad_params = bad_shipment_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_shipment(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Shipment, existing_schema.id)
#   #   end
#   # end

#   # describe "update_shipping_category/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:shipping_category)

#   #     params = string_params_for(:shipping_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ShippingCategory{} = returned_schema} = update_shipping_category(existing_schema, params)

#   #     schema_from_db = Repo.get(ShippingCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:shipping_category)

#   #     bad_params = bad_shipping_category_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_shipping_category(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ShippingCategory, existing_schema.id)
#   #   end
#   # end

#   # describe "update_shipping_method/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:shipping_method)

#   #     params = string_params_for(:shipping_method)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %ShippingMethod{} = returned_schema} = update_shipping_method(existing_schema, params)

#   #     schema_from_db = Repo.get(ShippingMethod, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:shipping_method)

#   #     bad_params = bad_shipping_method_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_shipping_method(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(ShippingMethod, existing_schema.id)
#   #   end
#   # end

#   # describe "update_stock_location/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:stock_location)

#   #     params = string_params_for(:stock_location)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %StockLocation{} = returned_schema} = update_stock_location(existing_schema, params)

#   #     schema_from_db = Repo.get(StockLocation, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(returned_schema, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:stock_location)

#   #     bad_params = bad_stock_location_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_stock_location(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(StockLocation, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_shipment/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:shipment)

#   #     assert {:ok, _deleted_schema} = delete_shipment(schema)

#   #     refute Repo.get(Shipment, schema.id)
#   #   end
#   # end

#   # describe "delete_shipping_category/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:shipping_category)

#   #     assert {:ok, _deleted_schema} = delete_shipping_category(schema)

#   #     refute Repo.get(ShippingCategory, schema.id)
#   #   end
#   # end

#   # describe "delete_shipping_method/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:shipping_method)

#   #     assert {:ok, _deleted_schema} = delete_shipping_method(schema)

#   #     refute Repo.get(ShippingMethod, schema.id)
#   #   end
#   # end

#   # describe "delete_stock_location/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:stock_location)

#   #     assert {:ok, _deleted_schema} = delete_stock_location(schema)

#   #     refute Repo.get(StockLocation, schema.id)
#   #   end
#   # end

#   # #########################
#   # # Store Credits Context #
#   # #########################

#   # describe "create_credit_category/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:credit_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CreditCategory{} = returned_schema} = 
#   #       create_credit_category(params)

#   #     schema_from_db = Repo.get(CreditCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}" 
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_credit_category_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_credit_category(bad_params)
#   #   end
#   # end

#   # describe "create_credit_reason/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:credit_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

      

#   #     assert {:ok, %CreditReason{} = returned_schema} = 
#   #       create_credit_reason(params)

#   #     schema_from_db = Repo.get(CreditReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_credit_reason_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_credit_reason(bad_params)
#   #   end
#   # end

#   # describe "create_credit_type/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:credit_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CreditType{} = returned_schema} = 
#   #       create_credit_type(params)

#   #     schema_from_db = Repo.get(CreditType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end
      
#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_credit_type_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_credit_type(bad_params)
#   #   end
#   # end

#   # describe "create_credit/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:credit)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Credit{} = returned_schema} = 
#   #       create_credit(params)

#   #     schema_from_db = Repo.get(Credit, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Credit.decimal_fields() ++ Credit.naive_datetime_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Credit.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Credit.naive_datetime_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected =~ actual |> NaiveDateTime.to_string()
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_credit_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_credit(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_credit_category/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:credit_category)

#   #     assert %CreditCategory{} = returned_schema = get_credit_category(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_credit_category(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_credit_reason/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:credit_reason)

#   #     assert %CreditReason{} = returned_schema = get_credit_reason(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_credit_reason(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_credit_type/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:credit_type)

#   #     assert %CreditType{} = returned_schema = get_credit_type(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_credit_type(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_credit/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:credit)

#   #     assert %Credit{} = returned_schema = get_credit(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_credit(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_credit_category/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:credit_category)

#   #     params = string_params_for(:credit_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CreditCategory{} = returned_schema} = update_credit_category(existing_schema, params)

#   #     schema_from_db = Repo.get(CreditCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:credit_category)

#   #     bad_params = bad_credit_category_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_credit_category(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(CreditCategory, existing_schema.id)
#   #   end
#   # end

#   # describe "update_credit_reason/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:credit_reason)

#   #     params = string_params_for(:credit_reason)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CreditReason{} = returned_schema} = update_credit_reason(existing_schema, params)

#   #     schema_from_db = Repo.get(CreditReason, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:credit_reason)

#   #     bad_params = bad_credit_reason_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_credit_reason(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(CreditReason, existing_schema.id)
#   #   end
#   # end

#   # describe "update_credit_type/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:credit_type)

#   #     params = string_params_for(:credit_type)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %CreditType{} = returned_schema} = update_credit_type(existing_schema, params)

#   #     schema_from_db = Repo.get(CreditType, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :deleted_at ->
#   #           assert expected =~ actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end  
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:credit_type)

#   #     bad_params = bad_credit_type_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_credit_type(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(CreditType, existing_schema.id)
#   #   end
#   # end

#   # describe "update_credit/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:credit)

#   #     params = string_params_for(:credit)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Credit{} = returned_schema} = update_credit(existing_schema, params)

#   #     schema_from_db = Repo.get(Credit, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params,
#   #           field not in Credit.decimal_fields() ++ Credit.naive_datetime_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Credit.decimal_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected == actual |> Decimal.to_float()
#   #     end

#   #     for {field, expected} <- params,
#   #           field in Credit.naive_datetime_fields() do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert expected =~ actual |> NaiveDateTime.to_string()
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:credit)

#   #     bad_params = bad_credit_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_credit(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Credit, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_credit_category/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:credit_category)

#   #     assert {:ok, _deleted_schema} = delete_credit_category(schema)

#   #     refute Repo.get(CreditCategory, schema.id)
#   #   end
#   # end

#   # describe "delete_credit_reason/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:credit_reason)

#   #     assert {:ok, _deleted_schema} = delete_credit_reason(schema)

#   #     refute Repo.get(CreditReason, schema.id)
#   #   end
#   # end

#   # describe "delete_credit_type/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:credit_type)

#   #     assert {:ok, _deleted_schema} = delete_credit_type(schema)

#   #     refute Repo.get(CreditType, schema.id)
#   #   end
#   # end

#   # describe "delete_credit/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:credit)

#   #     assert {:ok, _deleted_schema} = delete_credit(schema)

#   #     refute Repo.get(Credit, schema.id)
#   #   end
#   # end

#   # ##########################
#   # # Store Settings Context #
#   # ##########################

#   # # Create
#   # describe "create_payment_method/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:payment_method)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PaymentMethod{} = returned_schema} = 
#   #       create_payment_method(params)

#   #     schema_from_db = Repo.get(PaymentMethod, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}" 
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_payment_method_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_payment_method(bad_params)
#   #   end
#   # end

#   # describe "create_store/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:store)
#   #              |> Map.drop(["inserted_at", "updated_at"])

      

#   #     assert {:ok, %Store{} = returned_schema} = 
#   #       create_store(params)

#   #     schema_from_db = Repo.get(Store, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_store_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_store(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_payment_method/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:payment_method)

#   #     assert %PaymentMethod{} = returned_schema = get_payment_method(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_payment_method(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_store/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:store)

#   #     assert %Store{} = returned_schema = get_store(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_store(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_payment_method/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:payment_method)

#   #     params = string_params_for(:payment_method)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %PaymentMethod{} = returned_schema} = update_payment_method(existing_schema, params)

#   #     schema_from_db = Repo.get(PaymentMethod, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:payment_method)

#   #     bad_params = bad_payment_method_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_payment_method(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(PaymentMethod, existing_schema.id)
#   #   end
#   # end

#   # describe "update_store/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:store)

#   #     params = string_params_for(:store)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Store{} = returned_schema} = update_store(existing_schema, params)

#   #     schema_from_db = Repo.get(Store, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:store)

#   #     bad_params = bad_store_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_store(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Store, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_payment_method/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:payment_method)

#   #     assert {:ok, _deleted_schema} = delete_payment_method(schema)

#   #     refute Repo.get(PaymentMethod, schema.id)
#   #   end
#   # end

#   # describe "delete_store/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:store)

#   #     assert {:ok, _deleted_schema} = delete_store(schema)

#   #     refute Repo.get(Store, schema.id)
#   #   end
#   # end

#   # #################
#   # # Taxes Context #
#   # #################

#   # # Create
#   # describe "create_tax_category/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:tax_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %TaxCategory{} = returned_schema} = 
#   #       create_tax_category(params)

#   #     schema_from_db = Repo.get(TaxCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}" 
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_tax_category_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_tax_category(bad_params)
#   #   end
#   # end

#   # describe "create_tax_rate/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:tax_rate)
#   #              |> Map.drop(["inserted_at", "updated_at"])

      

#   #     assert {:ok, %TaxRate{} = returned_schema} = 
#   #       create_tax_rate(params)

#   #     schema_from_db = Repo.get(TaxRate, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         :deleted_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_tax_rate_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_tax_rate(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_tax_category/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:tax_category)

#   #     assert %TaxCategory{} = returned_schema = get_tax_category(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_tax_category(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_tax_rate/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:tax_rate)

#   #     assert %TaxRate{} = returned_schema = get_tax_rate(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_tax_rate(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_tax_category/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:tax_category)

#   #     params = string_params_for(:tax_category)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %TaxCategory{} = returned_schema} = update_tax_category(existing_schema, params)

#   #     schema_from_db = Repo.get(TaxCategory, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:tax_category)

#   #     bad_params = bad_tax_category_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_tax_category(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(TaxCategory, existing_schema.id)
#   #   end
#   # end

#   # describe "update_tax_rate/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:tax_rate)

#   #     params = string_params_for(:tax_rate)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %TaxRate{} = returned_schema} = update_tax_rate(existing_schema, params)

#   #     schema_from_db = Repo.get(TaxRate, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       case field do
#   #         :amount ->
#   #           assert expected == actual |> Decimal.to_float()
#   #         :deleted_at ->
#   #           assert expected == actual |> NaiveDateTime.to_string()
#   #         _ ->
#   #           assert actual == expected,
#   #             "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #       end
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:tax_rate)

#   #     bad_params = bad_tax_rate_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_tax_rate(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(TaxRate, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_tax_category/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:tax_category)

#   #     assert {:ok, _deleted_schema} = delete_tax_category(schema)

#   #     refute Repo.get(TaxCategory, schema.id)
#   #   end
#   # end

#   # describe "delete_tax_rate/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:tax_rate)

#   #     assert {:ok, _deleted_schema} = delete_tax_rate(schema)

#   #     refute Repo.get(TaxRate, schema.id)
#   #   end
#   # end

#   # #############
#   # # Zones API #
#   # #############

#   # describe "create_country/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:country)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Country{} = returned_schema} = 
#   #       create_country(params)

#   #     schema_from_db = Repo.get(Country, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}" 
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_country_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_country(bad_params)
#   #   end
#   # end

#   # describe "create_state/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:state)
#   #              |> Map.drop(["inserted_at", "updated_at"])

      

#   #     assert {:ok, %State{} = returned_schema} = 
#   #       create_state(params)

#   #     schema_from_db = Repo.get(State, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_state_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_state(bad_params)
#   #   end
#   # end

#   # describe "create_zone/1" do
#   #   test "success: it inserts a schema in the db and returns the schema" do
#   #     params = string_params_for(:zone)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Zone{} = returned_schema} = 
#   #       create_zone(params)

#   #     schema_from_db = Repo.get(Zone, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end
      
#   #     assert schema_from_db.inserted_at == schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when user can't be created" do
#   #     bad_params = bad_zone_params()

#   #     assert {:error, %Changeset{valid?: false}} = create_zone(bad_params)
#   #   end
#   # end

#   # # Read
#   # describe "get_country/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:country)

#   #     assert %Country{} = returned_schema = get_country(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_country(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_state/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:state)

#   #     assert %State{} = returned_schema = get_state(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_state(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # describe "get_zone/1" do
#   #   test "success: it returns a schema when given a valid UUID" do
#   #     existing_schema = insert(:zone)

#   #     assert %Zone{} = returned_schema = get_zone(existing_schema.id)

#   #     assert returned_schema == existing_schema
#   #   end

#   #   test "error: it returns nil when a schema doesn't exist" do
#   #     assert get_zone(Enum.random(1..1000)) == nil
#   #   end
#   # end

#   # # Update
#   # describe "update_country/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:country)

#   #     params = string_params_for(:country)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Country{} = returned_schema} = update_country(existing_schema, params)

#   #     schema_from_db = Repo.get(Country, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:country)

#   #     bad_params = bad_country_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_country(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Country, existing_schema.id)
#   #   end
#   # end

#   # describe "update_state/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:state)

#   #     params = string_params_for(:state)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %State{} = returned_schema} = update_state(existing_schema, params)

#   #     schema_from_db = Repo.get(State, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:state)

#   #     bad_params = bad_state_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_state(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(State, existing_schema.id)
#   #   end
#   # end

#   # describe "update_zone/2" do
#   #   test "success: it updates database and returns the schema" do
#   #     existing_schema = insert(:zone)

#   #     params = string_params_for(:zone)
#   #              |> Map.drop(["inserted_at", "updated_at"])

#   #     assert {:ok, %Zone{} = returned_schema} = update_zone(existing_schema, params)

#   #     schema_from_db = Repo.get(Zone, returned_schema.id)
#   #     assert returned_schema == schema_from_db

#   #     params = atom_map(params)

#   #     for {field, expected} <- params do
#   #       actual = Map.get(schema_from_db, field)

#   #       assert actual == expected,
#   #         "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
#   #     end

#   #     assert existing_schema.inserted_at == schema_from_db.inserted_at
#   #     refute existing_schema.updated_at == schema_from_db.updated_at
#   #     assert %NaiveDateTime{} = schema_from_db.updated_at
#   #   end

#   #   test "error: returns an error tuple when cart can't be updated" do
#   #     existing_schema = insert(:zone)

#   #     bad_params = bad_zone_params()

#   #     assert {:error, %Changeset{valid?: false, errors: _errors}} =
#   #              update_zone(existing_schema, bad_params)

#   #     assert existing_schema == Repo.get(Zone, existing_schema.id)
#   #   end
#   # end

#   # # Delete
#   # describe "delete_country/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:country)

#   #     assert {:ok, _deleted_schema} = delete_country(schema)

#   #     refute Repo.get(Country, schema.id)
#   #   end
#   # end

#   # describe "delete_state/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:state)

#   #     assert {:ok, _deleted_schema} = delete_state(schema)

#   #     refute Repo.get(State, schema.id)
#   #   end
#   # end

#   # describe "delete_zone/1" do
#   #   test "success: it deletes the schema" do
#   #     schema = insert(:zone)

#   #     assert {:ok, _deleted_schema} = delete_zone(schema)

#   #     refute Repo.get(Zone, schema.id)
#   #   end
#   # end
# end
