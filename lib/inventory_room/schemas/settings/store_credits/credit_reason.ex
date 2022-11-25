defmodule InventoryRoom.Settings.StoreCredits.CreditReason do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_reasons" do
    field :name, :string
    timestamps()
  end

  def fields do
		__MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
	end

	def changeset(params) when is_map(params), do: changeset(%__MODULE__{}, params)
	def changeset(%__MODULE__{} = reason, params) do
		reason |> cast(params, fields())
	end

	def create_changeset(params), do: create_changeset(%__MODULE__{}, params)
	def create_changeset(%__MODULE__{} = reason, params) do
		reason |> changeset(params)
	end

	def delete_changeset(%__MODULE__{} = reason) do
    reason |> changeset(%{})
  end
end