defmodule MinhaApi.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :author, MinhaApi.Blog.Author
    has_many :comments, MinhaApi.Blog.Comment
    has_many :reactions, MinhaApi.Blog.Reaction

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :author_id])
    |> validate_required([:title, :body, :author_id])
  end
end
