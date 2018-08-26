defmodule GetSetWeb.Router do
  use GetSetWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/redis", GetSetWeb do
    pipe_through :api

    get "/status", RedisController, :index
    get "/keys/:key", RedisController, :get
    put "/keys/:key", RedisController, :set
  end
end
