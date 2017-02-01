defmodule Tumblr.PostController do
  use Tumblr.Web, :controller

  alias Tumblr.Post
  alias Tumblr.Repo

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.html", posts: posts )
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    IO.inspect post_params
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    most_recent = Repo.one(from x in Tumblr.Post, order_by: [desc: x.id], limit: 1)
    change_id = String.to_integer id

    most_recent_id = most_recent.id



    first_element_in_table = Repo.one(from x in Tumblr.Post, order_by: [asc: x.id], limit: 1)
    first_element_in_table_id = first_element_in_table.id
    IO.inspect first_element_in_table_id

    if change_id < first_element_in_table_id do
      IO.inspect "es mas pequeno"
      render(conn, "404.html")
    end



    if change_id > most_recent_id do
      IO.inspect "es mas grande"
      render(conn, "404.html")
    end


    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post)
  end

  def next(conn, %{"id" => id}) do
    test = String.to_integer(id) + 1
    render(conn, "testing.html", test: test)
  end








end
