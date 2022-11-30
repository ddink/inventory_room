defmodule InventoryRoom.Contexts.Inventory do
  alias StoreRepo.Repo
  alias InventoryRoom.Inventory.StockItem

  def create_stock_item(params) do
    %StockItem{}
    |> StockItem.create_changeset(params)
    |> Repo.insert
  end

  def get_stock_item(id), do: Repo.get(StockItem, id)

  def update_stock_item(%StockItem{} = schema, params) do
    schema
    |> StockItem.changeset(params)
    |> Repo.update
  end

  def delete_stock_item(%StockItem{} = schema) do
    StockItem.delete_changeset(schema)
    |> Repo.delete
  end
end