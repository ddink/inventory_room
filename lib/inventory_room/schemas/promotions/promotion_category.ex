# create_table "spree_promotion_categories", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "code"
# end

defmodule InventoryRoom.Promotions.PromotionCategory do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "promotion_categories" do
    field(:name, :string)
    field(:code, :string)
    timestamps()
  end

  def fields do
    __MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(%__MODULE__{} = promotion_category, params) do
    promotion_category |> cast(params, fields())
  end

  def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
  def create_changeset(%__MODULE__{} = promotion_category, params) do
    promotion_category |> changeset(params)
  end

  def delete_changeset(%__MODULE__{} = promotion_category) do
    promotion_category |> changeset(%{})
  end
end