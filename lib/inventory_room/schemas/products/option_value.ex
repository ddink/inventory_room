defmodule InventoryRoom.Products.OptionValue do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventoryRoom.Products.OptionType

  schema "option_values" do
    field :position, :integer
    field :name, :string
    field :presentation, :string
    belongs_to :option_type, OptionType
    timestamps()
  end

  def fields do
    __MODULE__.__schema__(:fields) -- [:id, :inserted_at, :updated_at]
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(%__MODULE__{} = option_value, params) do
    option_value |> cast(params, fields())
  end

  def create_changeset(params), do: changeset(%__MODULE__{}, params)
  def create_changeset(%__MODULE__{} = option_value, params) do
    option_value |> changeset(params)
  end

  def delete_changeset(%__MODULE__{} = option_value) do
    option_value |> changeset(%{})
  end
end