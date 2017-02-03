defmodule Tumblr.Repo.Migrations.AddCssField do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :css, :string
    end
  end
end
