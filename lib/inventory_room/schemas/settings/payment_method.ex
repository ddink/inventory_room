# create_table "spree_payment_methods", force: :cascade do |t|
#   t.string "type"
#   t.string "name"
#   t.text "description"
#   t.boolean "active", default: true
#   t.datetime "deleted_at"
#   t.datetime "created_at", precision: 6
#   t.datetime "updated_at", precision: 6
#   t.string "display_on"
#   t.boolean "auto_capture"
#   t.text "preferences"
#   t.string "preference_source"
#   t.integer "position", default: 0
#   t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type"
# end

# *   PaymentMethod's `display_on` column has been replaced with `available_to_users` and `available_to_admin`.
#     The existing attributes and scopes have been deprecated.

defmodule InventoryRoom.Settings.PaymentMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment_methods" do
    field :type, :string
    field :name, :string
    field :description, :string
    field :active, :boolean
    field :available_to_users, :boolean
    field :available_to_admin, :boolean
    field :auto_capture, :boolean
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = payment_method, params) do
		payment_method |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = payment_method, params) do
		payment_method |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = payment_method) do
    payment_method |> changeset(%{})
  end
end