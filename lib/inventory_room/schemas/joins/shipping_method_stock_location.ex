defmodule InventoryRoom.Joins.ShippingMethodStockLocation do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Settings.Shipping.{ShippingMethod, StockLocation}

  schema "shipping_method_stock_locations" do
    belongs_to :shipping_method, ShippingMethod
    belongs_to :stock_location, StockLocation
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    fields()
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = join, params) do
		join |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = join, params) do
		join 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = join) do
    join |> changeset(%{})
  end
end