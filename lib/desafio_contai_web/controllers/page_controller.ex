defmodule DesafioContaiWeb.PageController do
  use DesafioContaiWeb, :controller

  def index(conn, _params) do
    html(conn, ~s(use <a href="/api/swagger">/api/swagger</a>) )
  end
end
