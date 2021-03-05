defmodule DesafioContai.Repo.Migrations.CreateCalcHistory do
  use Ecto.Migration

  def change do
    create table(:calc_history) do
      add :result, :integer
      timestamps
    end
  end
end
