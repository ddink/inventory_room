defmodule InventoryRoom.Factory do
  use ExMachina.Ecto, repo: StoreRepo.Repo

  alias InventoryRoom.Products.{
    OptionType,
    OptionValue
  }

  def option_type_factory do
    option = ["size", "color", "style"] |> Enum.random()
    
    %OptionType{
      name: "product-#{option}",
      presentation: option,
      position: Enum.random(1..10)
    }
  end

  def option_value_factory do
    presentation_map = %{
      "extra small" => "XS",
      "small" => "S",
      "medium" => "M",
      "large" => "L",
      "extra large" => "XL"
    }
    value = presentation_map 
            |> Map.keys() 
            |> Enum.random()
    
    %OptionValue{
      position: Enum.random(1..10),
      name: value,
      presentation: presentation_map[value]
    }
  end
end