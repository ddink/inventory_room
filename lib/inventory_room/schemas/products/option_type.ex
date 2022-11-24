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
	def changeset(%__MODULE__{} = cart, params) do
		cart |> cast(params, fields())
	end
end