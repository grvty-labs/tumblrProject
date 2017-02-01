defmodule Tumblr.Post do
  use Tumblr.Web, :model
  use Arc.Ecto.Schema

  schema "posts" do
    field :title, :string
    field :description, :string
    field :image, Tumblr.ImageUploader.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :image])
    |> validate_required([:title, :description, :image])
  end
end
