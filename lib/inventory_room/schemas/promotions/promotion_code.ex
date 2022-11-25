# create_table "spree_promotion_codes", force: :cascade do |t|
#   t.integer "promotion_id", null: false
#   t.string "value", null: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id"
#   t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true
# end

defmodule InventoryRoom.Promotions.PromotionCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Promotions.Promotion

  schema "promotion_codes" do
    belongs_to :promotion, Promotion
    field :value, :string
    timestamps()
  end

  def fields do
    __MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(%__MODULE__{} = promotion_code, params) do
    promotion_code |> cast(params, fields())
  end

  def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
  def create_changeset(%__MODULE__{} = promotion_code, params) do
    promotion_code |> changeset(params)
  end

  def delete_changeset(%__MODULE__{} = promotion_code) do
    promotion_code |> changeset(%{})
  end
end