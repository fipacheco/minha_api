defmodule MinhaApi.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MinhaApi.Blog` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> MinhaApi.Blog.create_author()

    author
  end

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> MinhaApi.Blog.create_post()

    post
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> MinhaApi.Blog.create_comment()

    comment
  end

  @doc """
  Generate a reaction.
  """
  def reaction_fixture(attrs \\ %{}) do
    {:ok, reaction} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> MinhaApi.Blog.create_reaction()

    reaction
  end
end
