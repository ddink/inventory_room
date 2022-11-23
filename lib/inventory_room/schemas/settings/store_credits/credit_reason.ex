defmodule InventoryRoom.Settings.StoreCredits.CreditReason do
  use Ecto.Schema

  schema "store_credit_reasons" do
    field :name, :string
    timestamps()
  end
end