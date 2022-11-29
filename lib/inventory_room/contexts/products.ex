defmodule InventoryRoom.Contexts.Products do
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
  def create_option_type(params) do
    %OptionType{}
    |> OptionType.create_changeset(params)
    |> Repo.insert()
  end

  def create_option_value(params) do
    %OptionValue{}
    |> OptionValue.create_changeset(params)
    |> Repo.insert()
  end

  def create_price(params) do
    %Price{}
    |> Price.create_changeset(params)
    |> Repo.insert()
  end

  def create_property(params) do
    %Property{}
    |> Property.create_changeset(params)
    |> Repo.insert()
  end

  def create_taxon(params) do
    %Taxon{}
    |> Taxon.create_changeset(params)
    |> Repo.insert()
  end

  def create_taxonomy(params) do
    %Taxonomy{}
    |> Taxonomy.create_changeset(params)
    |> Repo.insert()
  end

  def create_product(params) do
    %Product{}
    |> Product.create_changeset(params)
    |> Repo.insert()
  end

  def create_product_image(params) do
    %ProductImage{}
    |> ProductImage.create_changeset(params)
    |> Repo.insert()
  end

  def create_variant(params) do
    %Variant{}
    |> Variant.create_changeset(params)
    |> Repo.insert()
  end

  def create_variant_image(params) do
    %VariantImage{}
    |> VariantImage.create_changeset(params)
    |> Repo.insert()
  end

  # Read
  def get_option_type(id), do: Repo.get(OptionType, id)

  def get_option_value(id), do: Repo.get(OptionValue, id)

  def get_price(id), do: Repo.get(Price, id)

  def get_property(id), do: Repo.get(Property, id)

  def get_taxon(id), do: Repo.get(Taxon, id)

  def get_taxonomy(id), do: Repo.get(Taxonomy, id)

  def get_product(id), do: Repo.get(Product, id)

  def get_product_image(id), do: Repo.get(ProductImage, id)

  def get_variant(id), do: Repo.get(Variant, id)

  def get_variant_image(id), do: Repo.get(VariantImage, id)

  # Update
  def update_option_type(%OptionType{} = schema, params) do
    schema
    |> OptionType.changeset(params)
    |> Repo.update()
  end

  def update_option_value(%OptionValue{} = schema, params) do
    schema
    |> OptionValue.changeset(params)
    |> Repo.update()
  end

  def update_price(%Price{} = schema, params) do
    schema
    |> Price.changeset(params)
    |> Repo.update()
  end

  def update_property(%Property{} = schema, params) do
    schema
    |> Property.changeset(params)
    |> Repo.update()
  end

  def update_taxon(%Taxon{} = schema, params) do
    schema
    |> Taxon.changeset(params)
    |> Repo.update()
  end

  def update_taxonomy(%Taxonomy{} = schema, params) do
    schema
    |> Taxonomy.changeset(params)
    |> Repo.update()
  end

  def update_product(%Product{} = schema, params) do
    schema
    |> Product.changeset(params)
    |> Repo.update()
  end

  def update_product_image(%ProductImage{} = schema, params) do
    schema
    |> ProductImage.changeset(params)
    |> Repo.update()
  end

  def update_variant(%Variant{} = schema, params) do
    schema
    |> Variant.changeset(params)
    |> Repo.update()
  end

  def update_variant_image(%VariantImage{} = schema, params) do
    schema
    |> VariantImage.changeset(params)
    |> Repo.update()
  end

  # Delete

  def delete_option_type(%OptionType{} = schema) do
    OptionType.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_option_value(%OptionValue{} = schema) do
    OptionValue.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_price(%Price{} = schema) do
    Price.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_property(%Property{} = schema) do
    Property.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_taxon(%Taxon{} = schema) do
    Taxon.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_taxonomy(%Taxonomy{} = schema) do
    Taxonomy.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_product(%Product{} = schema) do
    Product.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_product_image(%ProductImage{} = schema) do
    ProductImage.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_variant(%Variant{} = schema) do
    Variant.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_variant_image(%VariantImage{} = schema) do
    VariantImage.delete_changeset(schema)
    |> Repo.delete()
  end
end