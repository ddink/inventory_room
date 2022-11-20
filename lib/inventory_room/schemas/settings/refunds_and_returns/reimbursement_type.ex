defmodule InventoryRoom.Settings.RefundsAndReturns.ReimbursementType do
  import Ecto.Schema

  schema "reimbursement_types" do
    field :name, :string
    field :active, :boolean
    field :mutable, :boolean
    field :type, :string
    timestamps()
  end
end