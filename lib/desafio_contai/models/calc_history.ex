defmodule DesafioContai.Models.CalcHistory do
  use Ecto.Schema

  schema "calc_history" do
    field :result, :integer

    timestamps()
  end
end
