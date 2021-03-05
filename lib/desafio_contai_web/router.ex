defmodule DesafioContaiWeb.Router do
  use DesafioContaiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DesafioContaiWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/api/v1/", DesafioContaiWeb do
    pipe_through :api

    get "/sum", CalcController, :sum
    get "/sub", CalcController, :sub
    get "/div", CalcController, :div
    get "/mult", CalcController, :mult
    get "/history", CalcController, :history

    get "/", PageController, :index
  end

  def swagger_info do
    %{
      schemes: ["http", "https"],
      info: %{
        version: "1.0",
        title: "DesafioContai - Calc",
        description: "API Documentation for DesafioContai - Calc v1",
        termsOfService: "Open for public",
        contact: %{
          name: "Helder de Sousa",
          email: "helderhenri@gmail.com"
        }
      },

      consumes: ["application/json"],
      produces: ["application/json"],
      tags: [
        %{name: "sum", description: "sum two numbers"},
        %{name: "sub", description: "subtracts two numbers"},
        %{name: "mult", description: "multiply two numbers"},
        %{name: "div", description: "divide two numbers"},
        %{name: "history", description: "show all history"},
      ]
    }
  end

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :desafio_contai,
      swagger_file: "swagger.json"
  end

  # Other scopes may use custom stacks.
  # scope "/api", DesafioContaiWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DesafioContaiWeb.Telemetry
    end
  end
end
