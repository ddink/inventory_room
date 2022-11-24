defmodule InventoryRoom.Products.OptionType do
  use Ecto.Schema
	import Ecto.Changeset
	
	schema "option_types" do
		field :name, :string
		field :presentation, :string
		field :position, :integer
		timestamps()
	end
	
	def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = option_type, params) do
		option_type |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = option_type, params) do
		option_type |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = option_type) do
    option_type |> changeset(%{})
  end
end