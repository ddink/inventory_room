defmodule InventoryRoom.Joins.ProductTaxon do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Products.{Product, Taxon}

  schema "product_taxons" do
    belongs_to :product, Product
    belongs_to :taxon, Taxon
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