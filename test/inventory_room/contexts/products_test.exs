defmodule InventoryRoom.Contexts.ProductsTest do
  use InventoryRoom.DataCase, async: true
  alias Ecto.Changeset
	alias InventoryRoom.Contexts.Products
  import InventoryRoom.Factory
	alias StoreRepo.Repo

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

  # Create
  describe "create_option_type/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:option_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %OptionType{} = returned_schema} = 
        Products.create_option_type(params)

      schema_from_db = Repo.get(OptionType, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_option_type_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_option_type(bad_params)
    end
  end

  describe "create_option_value/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:option_value)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %OptionValue{} = returned_schema} = 
        Products.create_option_value(params)

      schema_from_db = Repo.get(OptionValue, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_option_value_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_option_value(bad_params)
    end
  end

  describe "create_price/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:price)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Price{} = returned_schema} = 
        Products.create_price(params)

      schema_from_db = Repo.get(Price, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :amount ->
            assert expected == actual |> Decimal.to_float()
          :deleted_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_price_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_price(bad_params)
    end
  end

  describe "create_property/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:property)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Property{} = returned_schema} = 
        Products.create_property(params)

      schema_from_db = Repo.get(Property, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_property_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_property(bad_params)
    end
  end

  describe "create_taxon/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:taxon)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Taxon{} = returned_schema} = 
        Products.create_taxon(params)

      schema_from_db = Repo.get(Taxon, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :icon_updated_at ->
            assert expected == actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_taxon_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_taxon(bad_params)
    end
  end

  describe "create_taxonomy/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:taxonomy)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Taxonomy{} = returned_schema} = 
        Products.create_taxonomy(params)

      schema_from_db = Repo.get(Taxonomy, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_taxonomy_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_taxonomy(bad_params)
    end
  end

  describe "create_product/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:product)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Product{} = returned_schema} = 
        Products.create_product(params)

      schema_from_db = Repo.get(Product, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        case field do
          :available_on ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          :discontinue_on ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_product_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_product(bad_params)
    end
  end

  describe "create_product_image/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:product_image)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductImage{} = returned_schema} = 
        Products.create_product_image(params)

      schema_from_db = Repo.get(ProductImage, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_product_image_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_product_image(bad_params)
    end
  end

  describe "create_variant/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:variant)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Variant{} = returned_schema} = 
        Products.create_variant(params)

      schema_from_db = Repo.get(Variant, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
            field not in Variant.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        case field do
          :deleted_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      for {field, expected} <- params,
            field in Variant.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_variant_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_variant(bad_params)
    end
  end

  describe "create_variant_image/1" do
    test "success: it inserts a schema in the db and returns the schema" do
      params = string_params_for(:variant_image)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %VariantImage{} = returned_schema} = 
        Products.create_variant_image(params)

      schema_from_db = Repo.get(VariantImage, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert schema_from_db.inserted_at == schema_from_db.updated_at
    end

    test "error: returns an error tuple when user can't be created" do
      bad_params = bad_variant_image_params()

      assert {:error, %Changeset{valid?: false}} = Products.create_variant_image(bad_params)
    end
  end

  # Read
  describe "get_option_type/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:option_type)

      assert %OptionType{} = returned_schema = Products.get_option_type(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_option_type(Enum.random(1..1000)) == nil
    end
  end

  describe "get_option_value/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:option_value)

      assert %OptionValue{} = returned_schema = Products.get_option_value(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_option_value(Enum.random(1..1000)) == nil
    end
  end

  describe "get_price/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:price)

      assert %Price{} = returned_schema = Products.get_price(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_price(Enum.random(1..1000)) == nil
    end
  end

  describe "get_property/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:property)

      assert %Property{} = returned_schema = Products.get_property(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_property(Enum.random(1..1000)) == nil
    end
  end

  describe "get_taxon/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:taxon)

      assert %Taxon{} = returned_schema = Products.get_taxon(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_taxon(Enum.random(1..1000)) == nil
    end
  end

  describe "get_taxonomy/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:taxonomy)

      assert %Taxonomy{} = returned_schema = Products.get_taxonomy(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_taxonomy(Enum.random(1..1000)) == nil
    end
  end

  describe "get_product/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:product)

      assert %Product{} = returned_schema = Products.get_product(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_product(Enum.random(1..1000)) == nil
    end
  end

  describe "get_product_image/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:product_image)

      assert %ProductImage{} = returned_schema = Products.get_product_image(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_product_image(Enum.random(1..1000)) == nil
    end
  end

  describe "get_variant/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:variant)

      assert %Variant{} = returned_schema = Products.get_variant(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_variant(Enum.random(1..1000)) == nil
    end
  end

  describe "get_variant_image/1" do
    test "success: it returns a schema when given a valid UUID" do
      existing_schema = insert(:variant_image)

      assert %VariantImage{} = returned_schema = Products.get_variant_image(existing_schema.id)

      assert returned_schema == existing_schema
    end

    test "error: it returns nil when a schema doesn't exist" do
      assert Products.get_variant_image(Enum.random(1..1000)) == nil
    end
  end

  # Update
  describe "update_option_type/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:option_type)

      params = string_params_for(:option_type)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %OptionType{} = returned_schema} = Products.update_option_type(existing_schema, params)

      schema_from_db = Repo.get(OptionType, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
               "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:option_type)

      bad_params = bad_option_type_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_option_type(existing_schema, bad_params)

      assert existing_schema == Repo.get(OptionType, existing_schema.id)
    end
  end

  describe "update_option_value/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:option_value)

      params = string_params_for(:option_value)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %OptionValue{} = returned_schema} = Products.update_option_value(existing_schema, params)

      schema_from_db = Repo.get(OptionValue, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(schema_from_db, field)

        assert actual == expected,
               "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:option_value)

      bad_params = bad_option_value_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_option_value(existing_schema, bad_params)

      assert existing_schema == Repo.get(OptionValue, existing_schema.id)
    end
  end

  describe "update_price/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:price)

      params = string_params_for(:price)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Price{} = returned_schema} = Products.update_price(existing_schema, params)

      schema_from_db = Repo.get(Price, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        case field do
        :amount ->
          assert expected == actual |> Decimal.to_float()
        :deleted_at ->
          assert expected == actual |> NaiveDateTime.to_string()
        _ ->
          assert actual == expected,
            "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:price)

      bad_params = bad_price_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_price(existing_schema, bad_params)

      assert existing_schema == Repo.get(Price, existing_schema.id)
    end
  end

  describe "update_property/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:property)

      params = string_params_for(:property)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Property{} = returned_schema} = Products.update_property(existing_schema, params)

      schema_from_db = Repo.get(Property, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        assert actual == expected,
          "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:property)

      bad_params = bad_property_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_property(existing_schema, bad_params)

      assert existing_schema == Repo.get(Property, existing_schema.id)
    end
  end

  describe "update_taxon/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:taxon)

      params = string_params_for(:taxon)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Taxon{} = returned_schema} = Products.update_taxon(existing_schema, params)

      schema_from_db = Repo.get(Taxon, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        case field do
        :icon_updated_at ->
          assert expected == actual |> NaiveDateTime.to_string()
        _ ->
          assert actual == expected,
            "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:taxon)

      bad_params = bad_taxon_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_taxon(existing_schema, bad_params)

      assert existing_schema == Repo.get(Taxon, existing_schema.id)
    end
  end

  describe "update_taxonomy/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:taxonomy)

      params = string_params_for(:taxonomy)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Taxonomy{} = returned_schema} = Products.update_taxonomy(existing_schema, params)

      schema_from_db = Repo.get(Taxonomy, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        case field do
        :icon_updated_at ->
          assert expected == actual |> NaiveDateTime.to_string()
        _ ->
          assert actual == expected,
            "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:taxonomy)

      bad_params = bad_taxonomy_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_taxonomy(existing_schema, bad_params)

      assert existing_schema == Repo.get(Taxonomy, existing_schema.id)
    end
  end

  describe "update_product/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:product)

      params = string_params_for(:product)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Product{} = returned_schema} = Products.update_product(existing_schema, params)

      schema_from_db = Repo.get(Product, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        case field do
          :available_on ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          :discontinue_on ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end 
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:product)

      bad_params = bad_product_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_product(existing_schema, bad_params)

      assert existing_schema == Repo.get(Product, existing_schema.id)
    end
  end

  describe "update_product_image/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:product_image)

      params = string_params_for(:product_image)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %ProductImage{} = returned_schema} = Products.update_product_image(existing_schema, params)

      schema_from_db = Repo.get(ProductImage, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:product_image)

      bad_params = bad_product_image_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_product_image(existing_schema, bad_params)

      assert existing_schema == Repo.get(ProductImage, existing_schema.id)
    end
  end

  describe "update_variant/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:variant)

      params = string_params_for(:variant)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %Variant{} = returned_schema} = Products.update_variant(existing_schema, params)

      schema_from_db = Repo.get(Variant, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params,
          field not in Variant.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        case field do
          :deleted_at ->
            assert expected =~ actual |> NaiveDateTime.to_string()
          _ ->
            assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
        end  
      end

      for {field, expected} <- params,
            field in Variant.decimal_fields() do
        actual = Map.get(schema_from_db, field)

        assert expected == actual |> Decimal.to_float()
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:variant)

      bad_params = bad_variant_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_variant(existing_schema, bad_params)

      assert existing_schema == Repo.get(Variant, existing_schema.id)
    end
  end

  describe "update_variant_image/2" do
    test "success: it updates database and returns the schema" do
      existing_schema = insert(:variant_image)

      params = string_params_for(:variant_image)
               |> Map.drop(["inserted_at", "updated_at"])

      assert {:ok, %VariantImage{} = returned_schema} = Products.update_variant_image(existing_schema, params)

      schema_from_db = Repo.get(VariantImage, returned_schema.id)
      assert returned_schema == schema_from_db

      params = atom_map(params)

      for {field, expected} <- params do
        actual = Map.get(returned_schema, field)

        assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
      end

      assert existing_schema.inserted_at == schema_from_db.inserted_at
      refute existing_schema.updated_at == schema_from_db.updated_at
      assert %NaiveDateTime{} = schema_from_db.updated_at
    end

    test "error: returns an error tuple when cart can't be updated" do
      existing_schema = insert(:variant_image)

      bad_params = bad_variant_image_params()

      assert {:error, %Changeset{valid?: false, errors: _errors}} =
               Products.update_variant_image(existing_schema, bad_params)

      assert existing_schema == Repo.get(VariantImage, existing_schema.id)
    end
  end

  # Delete
  describe "delete_option_type/1" do
    test "success: it deletes the schema" do
      schema = insert(:option_type)

      assert {:ok, _deleted_schema} = Products.delete_option_type(schema)

      refute Repo.get(OptionType, schema.id)
    end
  end

  describe "delete_option_value/1" do
    test "success: it deletes the schema" do
      schema = insert(:option_value)

      assert {:ok, _deleted_schema} = Products.delete_option_value(schema)

      refute Repo.get(OptionValue, schema.id)
    end
  end

  describe "delete_price/1" do
    test "success: it deletes the schema" do
      schema = insert(:price)

      assert {:ok, _deleted_schema} = Products.delete_price(schema)

      refute Repo.get(Price, schema.id)
    end
  end

  describe "delete_property/1" do
    test "success: it deletes the schema" do
      schema = insert(:property)

      assert {:ok, _deleted_schema} = Products.delete_property(schema)

      refute Repo.get(Property, schema.id)
    end
  end

  describe "delete_taxon/1" do
    test "success: it deletes the schema" do
      schema = insert(:taxon)

      assert {:ok, _deleted_schema} = Products.delete_taxon(schema)

      refute Repo.get(Taxon, schema.id)
    end
  end

  describe "delete_taxonomy/1" do
    test "success: it deletes the schema" do
      schema = insert(:taxonomy)

      assert {:ok, _deleted_schema} = Products.delete_taxonomy(schema)

      refute Repo.get(Taxonomy, schema.id)
    end
  end

  describe "delete_product/1" do
    test "success: it deletes the schema" do
      schema = insert(:product)

      assert {:ok, _deleted_schema} = Products.delete_product(schema)

      refute Repo.get(Product, schema.id)
    end
  end

  describe "delete_product_image/1" do
    test "success: it deletes the schema" do
      schema = insert(:product_image)

      assert {:ok, _deleted_schema} = Products.delete_product_image(schema)

      refute Repo.get(ProductImage, schema.id)
    end
  end

  describe "delete_variant/1" do
    test "success: it deletes the schema" do
      schema = insert(:variant)

      assert {:ok, _deleted_schema} = Products.delete_variant(schema)

      refute Repo.get(Variant, schema.id)
    end
  end

  describe "delete_variant_image/1" do
    test "success: it deletes the schema" do
      schema = insert(:variant_image)

      assert {:ok, _deleted_schema} = Products.delete_variant_image(schema)

      refute Repo.get(VariantImage, schema.id)
    end
  end
end