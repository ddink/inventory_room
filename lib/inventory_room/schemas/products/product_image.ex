defmodule InventoryRoom.Products.ProductImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Products.Product

  schema "product_images" do
    field :file, Uploadex.Upload
    belongs_to :product, Product
    field :alt_text, :string
    field :url, :string
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

  def required_fields do
    fields -- [:alt_text]
  end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = image, params) do
		image |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = image, params) do
		image 
    |> changeset(params)
    |> validate_required(required_fields())
	end

	def delete_changeset(%__MODULE__{} = image) do
    image |> changeset(%{})
  end
end