defmodule InventoryRoom.Settings.Taxes.TaxCategory do
  import Ecto.Schema

  schema "tax_categories" do
    field :name, :string
    field :description, :string
    field :is_default, :boolean
    field :tax_code, :string
    timestamps()
  end
end