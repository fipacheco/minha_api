defmodule MinhaApi.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    belongs_to :post, MinhaApi.Blog.Post  # Associação com Post
    belongs_to :author, MinhaApi.Blog.Author  # Se houver associação com Author
    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :post_id, :author_id])  # Certifique-se de que os campos estão corretos
    |> validate_required([:body, :post_id])  # Ajuste conforme necessário
  end
end
