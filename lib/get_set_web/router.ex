defmodule GetSetWeb.Router do
  use GetSetWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GetSetWeb do
    pipe_through :api

    get "/", GssController, :index
    get "/key/:key", GssController, :get
    put "/key/:key", GssController, :set
  end
end
