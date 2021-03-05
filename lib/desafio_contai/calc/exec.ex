defmodule Calc.Exec do

  def run(fun, a, b) when is_integer(a) and is_integer(b) do
    fun.({a, b})
    |> Calc.Db.new
  end
  def run(fun, a, b) do
    parse_values_to_int([a, b])
    |> case do
      {:ok, a, b} when is_integer(a) and is_integer(b)->

        run(fun, a, b)
      _ ->
        Calc.Errors.numbers_are_invalid()
    end
  end

  def parse_values_to_int(list) do
    IO.inspect list
    Enum.map(list, fn
      nil -> nil
      arg ->
        case Integer.parse arg do
          {num, _} -> num
          _ -> nil
        end
    end)
    |> List.insert_at(0, :ok)
    |> List.to_tuple
  end
end
