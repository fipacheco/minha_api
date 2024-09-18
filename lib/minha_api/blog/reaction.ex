defmodule MinhaApi.Blog.Reaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reactions" do
    field :type, :string
    belongs_to :post, MinhaApi.Blog.Post  # Associação com Post
    belongs_to :author, MinhaApi.Blog.Author  # Permite reação anônima se necessário
    timestamps()
  end

  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [:type, :post_id, :author_id])  # Campos esperados
    |> validate_required([:type, :post_id])  # Certifique-se dos campos necessários
  end
end
