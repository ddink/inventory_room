# create_table "spree_stores", force: :cascade do |t|
#   t.string "name"
#   t.string "url"
#   t.text "meta_description"
#   t.text "meta_keywords"
#   t.string "seo_title"
#   t.string "mail_from_address"
#   t.string "default_currency"
#   t.string "code"
#   t.boolean "default", default: false, null: false
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "cart_tax_country_iso"
#   t.index ["code"], name: "index_spree_stores_on_code"
#   t.index ["default"], name: "index_spree_stores_on_default"
# end

defmodule InventoryRoom.Settings.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Joins.StorePaymentMethod

  schema "stores" do
    field :name, :string
    field :url, :string
    field :meta_description, :string
    field :meta_keywords, :string
    field :seo_title, :string
    field :mail_from_address, :string
    field :default_currency, :string
    field :currency, :string
    field :default, :boolean
    field :cart_tax_country_iso, :string
    has_many :store_payment_methods, StorePaymentMethod
    has_many :payment_methods, through: [:store_payment_methods, :payment_method]
    timestamps()  
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    [:default]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = store, params) do
		store |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = store, params) do
		store 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = store) do
    store |> changeset(%{})
  end
end