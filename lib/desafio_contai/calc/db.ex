defmodule Calc.Db do

  def new(calc) when is_integer(calc) do
    spawn fn ->
      DesafioContai.Repo.insert(%DesafioContai.Models.CalcHistory{ result: calc })
      |> Calc.Cache.clear_cache()
    end
    calc
  end
  def history() do
    Calc.Cache.from_cache_or_db()
  end


end
