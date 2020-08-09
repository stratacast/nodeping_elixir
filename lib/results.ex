defmodule NodePing.Results do
  @moduledoc """
  Get check results and uptime information
  """

  alias NodePing.HttpRequests, as: HttpRequests
  alias NodePing.Helpers, as: Helpers

  @api_url "https://api.nodeping.com/api/1"
  @results_path "/results"
  @uptime_path "/results/uptime"
  @current_path "/results/current"

  @doc """
  Get results for specified check

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get
  - `opts` - Optional arguments to filter results
  - `customerid` - optional ID to access a subaccount

  The list of values for `opts` can be found in NodePing's documents here:
  https://nodeping.com/docs-api-results.html#get

  ## Examples
      iex> opts = [{:span, 48}, {:limit, 10}]
      iex> token = Application.fetch_env!(:nodeping, :token)
      iex> checkid = Application.fetch_env!(:nodeping, :checkid)
      iex> {:ok, results} = NodePingResults.get_results(token, checkid, opts)
      iex> is_map(results)
      true
    [{:token, token}, {:accountsuppressall, accountsuppressall}]
  """
  def get_results(token, id, opts \\ [], customerid \\ nil) do
    querystrings =
      ([{:token, token}] ++ opts)
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @results_path <> "/#{id}" <> querystrings)
    |> HttpRequests.get()
  end

  def uptime(token, id, opts \\ [], customerid \\ nil) do
    querystrings =
      ([{:token, token}] ++ opts)
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @uptime_path <> "/#{id}" <> querystrings)
    |> HttpRequests.get()
  end

  def current_events(token, customerid \\ nil) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @current_path <> querystrings)
    |> HttpRequests.get()
  end
end
