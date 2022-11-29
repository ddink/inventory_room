# create_table "spree_store_credits", force: :cascade do |t|
#   t.integer "user_id"
#   t.integer "category_id"
#   t.integer "created_by_id"
#   t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
#   t.decimal "amount_used", precision: 8, scale: 2, default: "0.0", null: false
#   t.decimal "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
#   t.string "currency"
#   t.text "memo"
#   t.datetime "spree_store_credits"
#   t.datetime "deleted_at"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.integer "type_id"
#   t.datetime "invalidated_at"
#   t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at"
#   t.index ["type_id"], name: "index_spree_store_credits_on_type_id"
#   t.index ["user_id"], name: "index_spree_store_credits_on_user_id"
# end

defmodule InventoryRoom.Settings.StoreCredits.Credit do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.StoreCredits.{CreditCategory, CreditType}
  alias ShoppingCart.Schemas.User # will likely need to replace with Accounts.User or something like that

  schema "store_credits" do
    field :amount, :decimal
    field :amount_used, :decimal
    field :amount_authorized, :decimal
    field :currency, :string
    field :memo, :string
    # field :spree_store_credits, :naive_datetime
    field :deleted_at, :naive_datetime
    field :invalidated_at, :naive_datetime
    # field :created_by_id, :integer
    belongs_to :user, User
    belongs_to :credit_category, CreditCategory
    belongs_to :credit_type, CreditType
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def decimal_fields do
    [:amount, :amount_used, :amount_authorized]
  end

  def naive_datetime_fields do
    [:deleted_at, :invalidated_at]
  end

  def required_fields do
    decimal_fields()
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = credit, params) do
		credit |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = credit, params) do
		credit 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = credit) do
    credit |> changeset(%{})
  end
end