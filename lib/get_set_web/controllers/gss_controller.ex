defmodule GetSetWeb.GssController do
  use GetSetWeb, :controller

  def index(conn, _params) do
    text conn, "Welcome"
  end

  def get(conn, %{"key" => key}) do
    if key == "3" do
      json conn, %{key: key}
    else
      conn |> send_resp(404, "Not found")
    end
  end

  def set(conn, %{"key" => key, "value" => value}) do
    json conn, %{key: key, value: value}
  end
end
