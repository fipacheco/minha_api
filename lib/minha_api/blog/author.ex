defmodule MinhaApi.Blog.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
