defmodule Calc do

  def sum(a, b) do
    (fn {a,b}  ->
      a + b
    end)
    |> Calc.Exec.run(a,b)
  end

  def sub(a,b) do
    (fn {a,b}  ->
      a - b
    end)
    |> Calc.Exec.run(a,b)
  end

  def mult(a, b) do
    (fn {a,b}  ->
      a * b
    end)
    |> Calc.Exec.run(a,b)
  end
  def div(a,b) do
    (fn {a,b}  ->
      Integer.floor_div(a, b)
    end)
    |> Calc.Exec.run(a,b)
  end

  def history() do
    Calc.Db.history()
  end
end
