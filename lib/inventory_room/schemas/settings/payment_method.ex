defmodule InventoryRoom.Settings.PaymentMethod do
  use Ecto.Schema

  schema "payment_methods" do
    field :type, :string
    field :name, :string
    field :description, :string
    field :active, :boolean
    field :display_on, :string
    field :auto_capture, :boolean
    timestamps()
  end
end