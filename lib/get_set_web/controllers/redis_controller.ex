defmodule GetSetWeb.RedisController do
  use GetSetWeb, :controller

  def index(conn, _params) do
    case Redix.command(:redix_conn, ["PING"]) do
      {:ok, "PONG"} ->
        text conn, "PONG"
        _ ->
          "UH OH"
      end
  end

  def get(conn, %{"key" => key}) do
    {:ok, value} = redis_get(key)
    if value do
      json conn, %{key: key, value: value}
    else
      conn |> send_resp(404, "Not found")
    end
  end

  def set(conn, %{"key" => key, "value" => value}) do
    case redis_set(key, value) do
      {:ok, "OK"} ->
        json conn, %{key: key, value: value}
      _ ->
        conn |> send_resp(500, "Internal Server Error")
    end
  end

  defp redis_get(key) do
    Redix.command(:redix_conn, ["GET", namespaced_key(key)])
  end

  defp redis_set(key, value) do
    Redix.command(:redix_conn, ["SET", namespaced_key(key), value])
  end

  defp namespaced_key(key) do
    "get_set:" <> key
  end
end
