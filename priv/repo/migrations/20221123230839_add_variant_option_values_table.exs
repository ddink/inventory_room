defmodule StoreRepo.Repo.Migrations.AddVariantOptionValuesTable do
  use Ecto.Migration

  def change do
    create table("variant_option_values") do
      add :variant_id, references(:variants)
      add :option_value_id, references(:option_values)
      timestamps()
    end
  end
end
