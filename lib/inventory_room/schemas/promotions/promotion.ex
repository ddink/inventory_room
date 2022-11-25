# create_table "spree_promotions", force: :cascade do |t|
#   t.string "description"
#   t.datetime "expires_at"
#   t.datetime "starts_at"
#   t.string "name"
#   t.string "type"
#   t.integer "usage_limit"
#   t.string "match_policy", default: "all"
#   t.string "code"
#   t.boolean "advertise", default: false
#   t.string "path"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "promotion_category_id"
#   t.integer "per_code_usage_limit"
#   t.boolean "apply_automatically", default: false
#   t.index ["advertise"], name: "index_spree_promotions_on_advertise"
#   t.index ["apply_automatically"], name: "index_spree_promotions_on_apply_automatically"
#   t.index ["code"], name: "index_spree_promotions_on_code"
#   t.index ["expires_at"], name: "index_spree_promotions_on_expires_at"
#   t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type"
#   t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id"
#   t.index ["starts_at"], name: "index_spree_promotions_on_starts_at"
# end

defmodule InventoryRoom.Promotions.Promotion do
  use Ecto.Schema
  import Ecto.Changeset
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

  def fields do
    __MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
  end

  def date_fields do
    [:expires_at, :starts_at]
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(%__MODULE__{} = promotion, params) do
    promotion |> cast(params, fields())
  end

  def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
  def create_changeset(%__MODULE__{} = promotion, params) do
    promotion |> changeset(params)
  end

  def delete_changeset(%__MODULE__{} = promotion) do
    promotion |> changeset(%{})
  end
end