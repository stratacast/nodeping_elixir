defmodule NodePing.HttpRequests do
  @moduledoc """
  GET/POST/PUT/DELETE functions for interfacing with the NodePing API
  """

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Jason.decode!(reason)}
    end
  end

  def post(url, payload) when is_map(payload) do
    {:ok, payload_json} = Jason.encode(payload)
    headers = ["Content-Type": "application/json; charset=utf-8"]

    case HTTPoison.post(url, payload_json, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}
    end
  end

  def put(url, payload) when is_map(payload) do
    {:ok, payload_json} = Jason.encode(payload)
    headers = ["Content-Type": "application/json; charset=utf-8"]

    case HTTPoison.put(url, payload_json, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}
    end
  end

  def put(url) do
    case HTTPoison.put(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}
    end
  end

  def delete(url) do
    case HTTPoison.delete(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        {:error, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Jason.decode!(reason)}
    end
  end
end
