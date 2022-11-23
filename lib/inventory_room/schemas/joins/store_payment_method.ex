defmodule InventoryRoom.Joins.StorePaymentMethod do
  use Ecto.Schema
  alias InventoryRoom.Settings.{PaymentMethod, Store}

  schema "store_payment_methods" do
    belongs_to :payment_method, PaymentMethod
    belongs_to :store, Store
    timestamps()
  end
end