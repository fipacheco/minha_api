defmodule MinhaApiWeb.PostJSON do
  alias MinhaApi.Blog.Post

  @doc """
  Renders a list of posts.
  """
  def index(%{posts: posts}) do
    %{data: for(post <- posts, do: data(post))}
  end

  @doc """
  Renders a single post.
  """
  def show(%{post: post}) do
    %{data: data(post)}
  end

  defp data(%Post{} = post) do
    IO.puts("SHOW POST")

    %{
      id: post.id,
      title: post.title,
      body: post.body,
      author_id: post.author_id,
      # comments: render_comments(post.comments || []),  # Assegura que é uma lista
      # reactions: render_reactions(post.reactions || []),  # Assegura que é uma lista
      inserted_at: post.inserted_at,
      updated_at: post.updated_at
    }
  end




end
