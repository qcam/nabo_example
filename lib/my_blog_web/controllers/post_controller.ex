defmodule MyBlogWeb.PostController do
  use MyBlogWeb, :controller

  def index(conn, _params) do
    posts = MyBlog.PostRepo.all()
    render conn, "index.html", posts: posts
  end

  def show(conn, %{"id" => id}) do
    case MyBlog.PostRepo.get(id) do
      {:ok, post} ->
        render(conn, "show.html", post: post)
      {:error, _} ->
        conn
        |> put_status(:not_found)
        |> put_view(MyBlogWeb.ErrorView)
        |> render("404.html")
    end
  end
end
