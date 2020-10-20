defmodule JustASandbox.Repo.Migrations.CreateWidget do
  use Ecto.Migration

  def change do
    create table(:widget) do
      add :name, :string

      timestamps()
    end

  end
end
