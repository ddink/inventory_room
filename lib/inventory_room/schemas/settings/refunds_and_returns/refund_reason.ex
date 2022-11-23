defmodule InventoryRoom.Settings.RefundsAndReturns.RefundReason do
  use Ecto.Schema

  schema "refund_reasons" do
    field :name, :string
    field :active, :boolean
    field :mutable, :boolean
    field :code, :string
    timestamps()  
  end
end