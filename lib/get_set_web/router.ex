defmodule GetSetWeb.Router do
  use GetSetWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GetSetWeb do
    pipe_through :api
  end
end
