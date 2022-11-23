defmodule InventoryRoom.Settings.StoreCredits.CreditReason do
  use Ecto.Schema

  schema "credit_reasons" do
    field :name, :string
    timestamps()
  end
end