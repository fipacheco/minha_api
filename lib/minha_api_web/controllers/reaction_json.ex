defmodule MinhaApiWeb.ReactionJSON do
  alias MinhaApi.Blog.Reaction

  @doc """
  Renders a list of reactions.
  """
  def index(%{reactions: reactions}) do
    %{data: for(reaction <- reactions, do: data(reaction))}
  end

  @doc """
  Renders a single reaction.
  """
  def show(%{reaction: reaction}) do
    %{data: data(reaction)}
  end

  defp data(%Reaction{} = reaction) do
    %{
      id: reaction.id,
      type: reaction.type
    }
  end
end
