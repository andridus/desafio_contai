defmodule Calc.Cache do

  import Ecto.Query
  def from_cache_or_db() do
    Cachex.get(:calc, "history")
    |> case do
      {:ok, cached } when not is_nil(cached) ->
        cached
      _ ->
        history =
          DesafioContai.Repo.all(
            from c in DesafioContai.Models.CalcHistory,
            order_by: [ desc: c.id ]
          )
          |> Enum.map(&(Map.take(&1, [:result, :inserted_at, :updated_at])))

        Cachex.put(:calc, "history", history)
        history
    end
  end

  def clear_cache({:ok, _}), do: Cachex.clear(:calc)
  def clear_cache(_), do: nil
end
