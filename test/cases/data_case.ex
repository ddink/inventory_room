defmodule InventoryRoom.DataCase do
	use ExUnit.CaseTemplate
	alias ShoppingCart.Repo

	using do
		quote do
			import InventoryRoom.DataCase
			alias ShoppingCart.Factory
		end
	end

	setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end
end