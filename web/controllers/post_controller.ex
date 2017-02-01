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

    # Id current post
    change_id = String.to_integer id

    # Get last entry in the database
    most_recent = Repo.one(from x in Tumblr.Post, order_by: [desc: x.id], limit: 1)
    most_recent_id = most_recent.id

    # Get first entry in the database
    first_element_in_table = Repo.one(from x in Tumblr.Post, order_by: [asc: x.id], limit: 1)
    first_element_in_table_id = first_element_in_table.id

    # Just trying things haha
    previous_id = change_id - 1
    next_id = change_id + 1
    IO.inspect previous_id
    IO.inspect next_id



    if previous_id < first_element_in_table_id do
      leftCaret = false
      IO.inspect "oli Left"
    end

    if next_id > most_recent_id do
      rightCaret = false
      IO.inspect "oli Right"
    end

    # Get all info from the post
    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post, leftCaret: leftCaret, rightCaret: rightCaret)
  end

  def next(conn, %{"id" => id}) do
    test = String.to_integer(id) + 1
    render(conn, "testing.html", test: test)
  end








end
