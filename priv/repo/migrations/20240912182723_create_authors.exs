defmodule MinhaApi.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
