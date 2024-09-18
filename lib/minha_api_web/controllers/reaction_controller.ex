defmodule MinhaApiWeb.ReactionController do
  use MinhaApiWeb, :controller

  alias MinhaApi.Blog
  alias MinhaApi.Blog.Reaction

  action_fallback MinhaApiWeb.FallbackController

  def index(conn, _params) do
    reactions = Blog.list_reactions()
    render(conn, :index, reactions: reactions)
  end

  def create(conn, %{"reaction" => reaction_params}) do
    with {:ok, %Reaction{} = reaction} <- Blog.create_reaction(reaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/reactions/#{reaction}")
      |> render(:show, reaction: reaction)
    end
  end

  def show(conn, %{"id" => id}) do
    reaction = Blog.get_reaction!(id)
    render(conn, :show, reaction: reaction)
  end

  def update(conn, %{"id" => id, "reaction" => reaction_params}) do
    reaction = Blog.get_reaction!(id)

    with {:ok, %Reaction{} = reaction} <- Blog.update_reaction(reaction, reaction_params) do
      render(conn, :show, reaction: reaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    reaction = Blog.get_reaction!(id)

    with {:ok, %Reaction{}} <- Blog.delete_reaction(reaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
