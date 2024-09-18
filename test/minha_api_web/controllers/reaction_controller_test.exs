defmodule MinhaApiWeb.ReactionControllerTest do
  use MinhaApiWeb.ConnCase

  import MinhaApi.BlogFixtures

  alias MinhaApi.Blog.Reaction

  @create_attrs %{
    type: "some type"
  }
  @update_attrs %{
    type: "some updated type"
  }
  @invalid_attrs %{type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reactions", %{conn: conn} do
      conn = get(conn, ~p"/api/reactions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create reaction" do
    test "renders reaction when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/reactions", reaction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/reactions/#{id}")

      assert %{
               "id" => ^id,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/reactions", reaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update reaction" do
    setup [:create_reaction]

    test "renders reaction when data is valid", %{conn: conn, reaction: %Reaction{id: id} = reaction} do
      conn = put(conn, ~p"/api/reactions/#{reaction}", reaction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/reactions/#{id}")

      assert %{
               "id" => ^id,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, reaction: reaction} do
      conn = put(conn, ~p"/api/reactions/#{reaction}", reaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete reaction" do
    setup [:create_reaction]

    test "deletes chosen reaction", %{conn: conn, reaction: reaction} do
      conn = delete(conn, ~p"/api/reactions/#{reaction}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/reactions/#{reaction}")
      end
    end
  end

  defp create_reaction(_) do
    reaction = reaction_fixture()
    %{reaction: reaction}
  end
end
