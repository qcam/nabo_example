defmodule MyBlogWeb.PostController do
  use MyBlogWeb, :controller

  def index(conn, _params) do
    posts = MyBlog.PostRepo.all()
    render conn, "index.html", posts: posts
  end

  def show(conn, %{"id" => id}) do
    {:ok, post} = MyBlog.PostRepo.get(id)
    render conn, "show.html", post: post
  end
end
