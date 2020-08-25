defmodule NodePing.Notifications do
  @moduledoc """
  Get notifications for your checks
  """

  alias NodePing.HttpRequests, as: HttpRequests
  alias NodePing.Helpers, as: Helpers

  @api_url "https://api.nodeping.com/api/1/notifications"

  @doc """
  Get check notifications

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - `Map` of optional arguments for getting a subset of notifications. `nil` if no opts

  ## Opts

  - `id` - Check id of the check for which you want to list notifications
  - `span` - optional integer - number of hours of notifications to retrieve
  - `limit` - optional integer - number of records to retrieve. Defaults to 300
  - `subaccounts` - optional boolean - if set, notifications sent to subaccounts will also be included.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> opts = %{:id => "201911191441YC6SJ-4S9OJ78G", :limit => 30}
      iex> {:ok, result} = NodePing.Notifications.get(token, opts)
  """
  def get(token, opts, customerid \\ nil)

  def get(token, opts, customerid) when is_map(opts) do
    # Add the token and customerid to the opts map
    custid_added =
      for {k, v} <- Helpers.add_cust_id([{:token, token}], customerid), into: opts, do: {k, v}

    custid_added
    |> Map.to_list()
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.get(@api_url <> &1)).()
  end

  def get(token, opts, customerid) when is_nil(opts) do
    get(token, %{}, customerid)
  end

  @doc """
  Get check notifications

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - `Map` of optional arguments for getting a subset of notifications. `nil` if no opts

  ## Opts

  - `id` - Check id of the check for which you want to list notifications
  - `span` - optional integer - number of hours of notifications to retrieve
  - `limit` - optional integer - number of records to retrieve. Defaults to 300
  - `subaccounts` - optional boolean - if set, notifications sent to subaccounts will also be included.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> opts = %{:id => "201911191441YC6SJ-4S9OJ78G", :limit => 30}
      iex> result = NodePing.Notifications.get!(token, opts)
  """
  def get!(token, opts, customerid \\ nil)

  def get!(token, opts, customerid) when is_map(opts) do
    case get(token, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def get!(token, opts, customerid) when is_nil(opts) do
    get!(token, %{}, customerid)
  end
end
