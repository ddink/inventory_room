defmodule InventoryRoom.Settings.Shipping.ShippingCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipping_categories" do
    field :name, :string
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = category, params) do
		category |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = category, params) do
		category |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = category) do
    category |> changeset(%{})
  end
end