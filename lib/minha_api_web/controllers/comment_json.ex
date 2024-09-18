defmodule MinhaApiWeb.CommentJSON do
  alias MinhaApi.Blog.Comment

  @doc """
  Renders a list of comments.
  """
  def index(%{comments: comments}) do
    %{data: for(comment <- comments, do: data(comment))}
  end

  @doc """
  Renders a single comment.
  """
  def show(%{comment: comment}) do
    %{data: data(comment)}
  end

  defp data(%Comment{} = comment) do
    IO.puts("2")
    %{
      id: comment.id,
      body: comment.body,
      post_id: comment.post_id,  # Incluindo o post_id na resposta JSON
      author_id: comment.author_id,
      inserted_at: comment.inserted_at,
      updated_at: comment.updated_at
    }
  end
end
