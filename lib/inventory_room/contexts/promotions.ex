defmodule InventoryRoom.Contexts.Promotions do
  alias StoreRepo.Repo
  alias InventoryRoom.Promotions.{
    PromotionCategory,
    PromotionCode,
    Promotion
  }

  # Create
  def create_promotion_category(params) do
     %PromotionCategory{}
     |> PromotionCategory.create_changeset(params)
     |> Repo.insert()
  end

  def create_promotion_code(params) do
    %PromotionCode{}
    |> PromotionCode.create_changeset(params)
    |> Repo.insert()
  end

  def create_promotion(params) do
    %Promotion{}
    |> Promotion.create_changeset(params)
    |> Repo.insert()
  end

  # Read
  def get_promotion_category(id), do: Repo.get(PromotionCategory, id)

  def get_promotion_code(id), do: Repo.get(PromotionCode, id)

  def get_promotion(id), do: Repo.get(Promotion, id)

  # Update
  def update_promotion_category(%PromotionCategory{} = schema, params) do
    schema
    |> PromotionCategory.changeset(params)
    |> Repo.update()
  end

  def update_promotion_code(%PromotionCode{} = schema, params) do
    schema
    |> PromotionCode.changeset(params)
    |> Repo.update()
  end

  def update_promotion(%Promotion{} = schema, params) do
    schema
    |> Promotion.changeset(params)
    |> Repo.update()
  end

  # Delete
  def delete_promotion_category(%PromotionCategory{} = schema) do
    PromotionCategory.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_promotion_code(%PromotionCode{} = schema) do
    PromotionCode.delete_changeset(schema)
    |> Repo.delete()
  end

  def delete_promotion(%Promotion{} = schema) do
    Promotion.delete_changeset(schema)
    |> Repo.delete()
  end
end