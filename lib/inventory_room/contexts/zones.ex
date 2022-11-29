defmodule InventoryRoom.Contexts.Zones do
  alias StoreRepo.Repo
  alias InventoryRoom.Settings.Zones.{
    Country,
    State,
    Zone
  }

  # Create
  def create_country(params) do
    %Country{}
    |> Country.create_changeset(params)
    |> Repo.insert
  end

  def create_state(params) do
    %State{}
    |> State.create_changeset(params)
    |> Repo.insert
  end

  def create_zone(params) do
    %Zone{}
    |> Zone.create_changeset(params)
    |> Repo.insert
  end

  # Read
  def get_country(id), do: Repo.get(Country, id)

  def get_state(id), do: Repo.get(State, id)

  def get_zone(id), do: Repo.get(Zone, id)

  # Update
  def update_country(%Country{} = schema, params) do
    schema
    |> Country.changeset(params)
    |> Repo.update
  end

  def update_state(%State{} = schema, params) do
    schema
    |> State.changeset(params)
    |> Repo.update
  end

  def update_zone(%Zone{} = schema, params) do
    schema
    |> Zone.changeset(params)
    |> Repo.update
  end

  # Delete
  def delete_country(%Country{} = schema) do
    Country.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_state(%State{} = schema) do
    State.delete_changeset(schema)
    |> Repo.delete
  end

  def delete_zone(%Zone{} = schema) do
    Zone.delete_changeset(schema)
    |> Repo.delete
  end
end