defmodule DesafioContaiWeb.CalcController do
  use DesafioContaiWeb, :controller

 use PhoenixSwagger

  swagger_path :sum do
    get "/api/v1/sum"
    description "Sum two numbers"
    parameters do
      a :query, :string, "One Numer", required: true
      b :query, :string, "Other Numer", required: true
    end
    response 200, "Success"
  end
  def sum(conn, %{ "a" => a, "b" => b}) do
    json conn, Calc.sum(a, b)
  end
  def sum(conn, params ), do: error(conn, params)


  swagger_path :sub do
    get "/api/v1/sub"
    description "subtracts two numbers"
    parameters do
      a :query, :string, "One Numer", required: true
      b :query, :string, "Other Numer", required: true
    end
    response 200, "Success"
  end
  def sub(conn, %{ "a" => a, "b" => b}) do
    json conn, Calc.sub(a, b)
  end
  def sub(conn, params ), do: error(conn, params)

  swagger_path :div do
    get "/api/v1/div"
    description "Divide two numbers"
    parameters do
      a :query, :string, "One Numer", required: true
      b :query, :string, "Other Numer", required: true
    end
    response 200, "Success"
  end
  def div(conn, %{ "a" => a, "b" => b}) do
    json conn, Calc.div(a, b)
  end
  def div(conn, params ), do: error(conn, params)

  swagger_path :mult do
    get "/api/v1/mult"
    description "Multiply two numbers"
    parameters do
      a :query, :string, "One Numer", required: true
      b :query, :string, "Other Numer", required: true
    end
    response 200, "Success"
  end
  def mult(conn, %{ "a" => a, "b" => b}) do
    json conn, Calc.mult(a, b)
  end
  def mult(conn, params ), do: error(conn, params)

  swagger_path :history do
    get "/api/v1/history"
    description "Show all history"
    response 200, "Success"
  end
  def history(conn, _params) do
    json conn, Calc.history()
  end

  def error(conn, _params) do
    json conn, Calc.Errors.no_endpoint_arguments()
  end
end
