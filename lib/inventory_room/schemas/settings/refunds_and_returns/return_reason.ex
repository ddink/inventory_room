defmodule InventoryRoom.Settings.RefundsAndReturns.ReturnReason do
  import Ecto.Schema

  schema "return_reasons" do
    field :name, :string
    field :active, :boolean
    field :mutable, :boolean
    timestamps()
  end
end