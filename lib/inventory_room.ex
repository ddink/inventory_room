defmodule InventoryRoom do
  import InventoryRoom.API.{
    Inventory,
    Orders,
    Products,
    Promotions,
    RefundsAndReturns,
    Shipping,
    StoreCredits,
    StoreSettings,
    Taxes,
    Zones
  }
end
