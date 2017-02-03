defmodule Tumblr.Repo.Migrations.AddCodeField do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :code, :string
    end
  end
end
