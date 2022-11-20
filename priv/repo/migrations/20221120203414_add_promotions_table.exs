defmodule StoreRepo.Repo.Migrations.AddPromotionsTable do
  use Ecto.Migration

  def change do
    create table("promotions") do
      add :description, :text
      add :expires_at, :naive_datetime
      add :starts_at, :naive_datetime
      add :name, :string
      add :type, :string
      add :usage_limit, :integer
      add :match_policy, :string, default: "all"
      add :code, :string
      add :advertise, :boolean, default: false
      add :path, :string

      add :promotion_category_id, references(:promotion_categories, on_delete: :nothing)

      add :per_code_usage_limit, :integer
      add :apply_automatically, :boolean, default: false
      timestamps()
    end
  end
end
