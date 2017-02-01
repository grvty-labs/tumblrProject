defmodule Tumblr.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string
      add :image, :string

      timestamps()
    end

  end
end
