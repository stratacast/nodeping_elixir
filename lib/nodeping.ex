defmodule NodePing do
  @moduledoc """
  Get information about NodePing probes and regions
  """

  alias NodePing.HttpRequests, as: HttpRequests
  alias NodePing.Helpers, as: Helpers

  @api_url "https://api.nodeping.com/api/1"
  @probe_url "/info/probe"
  @loc_url "/info/location"

  @doc """
  Get information about all active NodePing probes
  The returned value is a JSON object that is converted to a map of maps

  ## Parameters

  - `token` - NodePing API token that is provided with account

  ## Examples
      iex> token = Application.fetch_env!(:nodeping, :token)
      iex> {:ok, result} = NodePing.get_probe(token)
      iex> is_map(result)
      true

  """
  def get_probe(token) do
    querystrings = Helpers.merge_querystrings([{:token, token}])

    (@api_url <> @probe_url <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get information about all active NodePing probes
  The returned value is a JSON object that is converted to a map of maps

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `probe` - The abbreviation for the region/location of probe.
  For example, nam for the NAM region or wa for the Washington server

  ## Examples
      iex> token = Application.fetch_env!(:nodeping, :token)
      iex> NodePing.get_probe(token, :de)

      {:ok,
       %{
         "country" => "DE",
         "ipv4" => "54.36.110.96",
         "ipv6" => "2001:41d0:700:1360::10",
         "location" => "de",
         "locationname" => "Frankfurt, Germany",
         "region" => "eur",
         "regionname" => "Europe"
       }}
  """
  def get_probe(token, probe) do
    querystrings = Helpers.merge_querystrings([{:token, token}])

    (@api_url <> @probe_url <> "/#{probe}" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get region location information
  """
  def get_locations(token) do
    querystrings = Helpers.merge_querystrings([{:token, token}])

    (@api_url <> @loc_url <> querystrings)
    |> HttpRequests.get()
  end

  def get_locations(token, loc) do
    querystrings = Helpers.merge_querystrings([{:token, token}])

    (@api_url <> @loc_url <> "/#{loc}" <> querystrings)
    |> HttpRequests.get()
  end
end
