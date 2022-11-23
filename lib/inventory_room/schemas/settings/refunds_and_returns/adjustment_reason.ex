defmodule InventoryRoom.Settings.RefundsAndReturns.AdjustmentReason do
  use Ecto.Schema
  
  schema "adjustment_reasons" do
    field :name, :string
    field :code, :string
    field :active, :boolean
    timestamps()
  end
end