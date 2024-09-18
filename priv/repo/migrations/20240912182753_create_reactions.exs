defmodule MinhaApi.Repo.Migrations.CreateReactions do
  use Ecto.Migration

  def change do
    create table(:reactions) do
      add :type, :string
      add :post_id, references(:posts, on_delete: :delete_all)  # Foreign key com posts
      add :author_id, references(:authors, on_delete: :nilify_all)  # Foreign key opcional com authors
      timestamps()
    end

    create index(:reactions, [:post_id])
  end
end
