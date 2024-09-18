defmodule MinhaApiWeb.PostController do
  use MinhaApiWeb, :controller

  alias MinhaApi.Blog
  alias MinhaApi.Blog.Post
  alias MinhaApi.Repo

  action_fallback MinhaApiWeb.FallbackController

  def index(conn, _params) do
    posts =
      MinhaApi.Repo.all(MinhaApi.Blog.Post)
      # Precarregar apenas reações associadas ao post
      |> MinhaApi.Repo.preload([:comments, :reactions])

    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Blog.create_post(post_params) do
      post = Repo.preload(post, [:comments, :reactions])
      IO.inspect(post.comments, label: "Loaded Comments")
      IO.inspect(post.reactions, label: "Loaded Reactions")

      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/posts/#{post.id}")
      |> render("show.json", post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.puts("1")

    post =
      Blog.get_post!(id)
      |> Repo.preload([:comments, :reactions])

    IO.inspect(post.comments, label: "Loaded Comments")
    IO.inspect(post.reactions, label: "Loaded Reactions")

    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)

    with {:ok, %Post{} = post} <- Blog.update_post(post, post_params) do
      render(conn, :show, post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)

    with {:ok, %Post{}} <- Blog.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end
end
