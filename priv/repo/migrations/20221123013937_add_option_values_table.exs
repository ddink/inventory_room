defmodule StoreRepo.Repo.Migrations.AddOptionValuesTable do
  use Ecto.Migration

  def change do
    create table("option_values") do
      add :position, :integer
      add :name, :string
      add :presentation, :string
      add :option_type_id, references(:option_types, on_delete: :nothing)
      timestamps()
    end
  end
end
