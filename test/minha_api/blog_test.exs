defmodule MinhaApi.BlogTest do
  use MinhaApi.DataCase

  alias MinhaApi.Blog

  describe "authors" do
    alias MinhaApi.Blog.Author

    import MinhaApi.BlogFixtures

    @invalid_attrs %{name: nil, email: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Blog.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Blog.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{name: "some name", email: "some email"}

      assert {:ok, %Author{} = author} = Blog.create_author(valid_attrs)
      assert author.name == "some name"
      assert author.email == "some email"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email"}

      assert {:ok, %Author{} = author} = Blog.update_author(author, update_attrs)
      assert author.name == "some updated name"
      assert author.email == "some updated email"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_author(author, @invalid_attrs)
      assert author == Blog.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Blog.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Blog.change_author(author)
    end
  end

  describe "posts" do
    alias MinhaApi.Blog.Post

    import MinhaApi.BlogFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.body == "some body"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.body == "some updated body"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end

  describe "comments" do
    alias MinhaApi.Blog.Comment

    import MinhaApi.BlogFixtures

    @invalid_attrs %{body: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Blog.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Blog.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Comment{} = comment} = Blog.create_comment(valid_attrs)
      assert comment.body == "some body"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Comment{} = comment} = Blog.update_comment(comment, update_attrs)
      assert comment.body == "some updated body"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_comment(comment, @invalid_attrs)
      assert comment == Blog.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Blog.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Blog.change_comment(comment)
    end
  end

  describe "reactions" do
    alias MinhaApi.Blog.Reaction

    import MinhaApi.BlogFixtures

    @invalid_attrs %{type: nil}

    test "list_reactions/0 returns all reactions" do
      reaction = reaction_fixture()
      assert Blog.list_reactions() == [reaction]
    end

    test "get_reaction!/1 returns the reaction with given id" do
      reaction = reaction_fixture()
      assert Blog.get_reaction!(reaction.id) == reaction
    end

    test "create_reaction/1 with valid data creates a reaction" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Reaction{} = reaction} = Blog.create_reaction(valid_attrs)
      assert reaction.type == "some type"
    end

    test "create_reaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_reaction(@invalid_attrs)
    end

    test "update_reaction/2 with valid data updates the reaction" do
      reaction = reaction_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Reaction{} = reaction} = Blog.update_reaction(reaction, update_attrs)
      assert reaction.type == "some updated type"
    end

    test "update_reaction/2 with invalid data returns error changeset" do
      reaction = reaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_reaction(reaction, @invalid_attrs)
      assert reaction == Blog.get_reaction!(reaction.id)
    end

    test "delete_reaction/1 deletes the reaction" do
      reaction = reaction_fixture()
      assert {:ok, %Reaction{}} = Blog.delete_reaction(reaction)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_reaction!(reaction.id) end
    end

    test "change_reaction/1 returns a reaction changeset" do
      reaction = reaction_fixture()
      assert %Ecto.Changeset{} = Blog.change_reaction(reaction)
    end
  end
end
