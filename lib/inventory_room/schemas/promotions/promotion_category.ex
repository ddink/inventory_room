defmodule InventoryRoom.Promotions.PromotionCategory do
  use Ecto.Schema
  
  schema "promotion_categories" do
    field(:name, :string)
    field(:code, :string)
    timestamps()
  end
end