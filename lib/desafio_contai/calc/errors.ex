defmodule Calc.Errors do

  def numbers_are_invalid() do
    %{msg: "The submited numbers are invalid, please, send integer numbers", error: "NUMBERS_ARE_INVALID"}
  end
  def no_endpoint_arguments() do
    %{msg: "Two arguments are needed. Example: {a} and {b} and two integers", error: "NO_ENDPOINT_ARGUMENTS"}
  end
end
