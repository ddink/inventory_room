defmodule InventoryRoom.Factory do
  use ExMachina.Ecto, repo: StoreRepo.Repo

  alias Inventory.Products.{
    OptionType,
  }

  def option_type_factory do
    option = ["size", "color", "style"] |> Enum.random()
    
    %OptionType{
      name: "product-#{option}",
      presentation: option,
      position: Enum.random(1..10)
    }
  end
end