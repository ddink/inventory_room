defmodule InventoryRoom.Promotions.Promotion do
  use Ecto.Schema
  alias InventoryRoom.Promotions.PromotionCategory
  
  schema "promotions" do
    field(:description, :string)
    field(:expires_at, :naive_datetime)
    field(:starts_at, :naive_datetime)
    field(:name, :string)
    field(:type, :string)
    field(:usage_limit, :integer)
    field(:match_policy, :string)
    field(:code, :string)
    field(:advertise, :boolean)
    field(:path, :string)
    belongs_to(:promotion_category, PromotionCategory)
    field(:per_code_usage_limit, :integer)
    field(:apply_automatically, :boolean)
    timestamps()
  end
end