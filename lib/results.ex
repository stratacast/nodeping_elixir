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
  - `opts` - Optional arguments to filter results. Empty list if no opts.
  - `customerid` - optional ID to access a subaccount

  The list of values for `opts` can be found in NodePing's documents here:
  https://nodeping.com/docs-api-results.html#get

  ## Opts

  - `span` - number of hours of results to retrieve. If used in combination with limit the narrower range will be used.
  - `limit` - optional integer - number of records to retrieve. Defaults to 300 if span is not set.
  - `start` - date/time for the start of the results. Timestamps should be milliseconds, or an RFC2822 or ISO 8601 date
  - `end` - date/time for the end of the results.
  - `offset` - integer offset to have the system perform uptime calculations for a different time zone.
  - `clean` - boolean sets whether to use the older format for the result record that includes a doc object. `true` strongly recommended

  ## Examples
      iex> opts = [{:span, 48}, {:limit, 10}]
      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> {:ok, results} = NodePing.Results.get_results(token, checkid, opts)
  """
  def get_results(token, id, opts, customerid \\ nil) do
    querystrings =
      ([{:token, token}] ++ opts)
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @results_path <> "/#{id}" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get results for specified check

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get
  - `opts` - Optional arguments to filter results. Empty list if no opts.
  - `customerid` - optional ID to access a subaccount

  The list of values for `opts` can be found in NodePing's documents here:
  https://nodeping.com/docs-api-results.html#get

  ## Opts

  - `span` - number of hours of results to retrieve. If used in combination with limit the narrower range will be used.
  - `limit` - optional integer - number of records to retrieve. Defaults to 300 if span is not set.
  - `start` - date/time for the start of the results. Timestamps should be milliseconds, or an RFC2822 or ISO 8601 date
  - `end` - date/time for the end of the results.
  - `offset` - integer offset to have the system perform uptime calculations for a different time zone.
  - `clean` - boolean sets whether to use the older format for the result record that includes a doc object. `true` strongly recommended

  ## Examples
      iex> opts = [{:span, 48}, {:limit, 10}]
      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> results = NodePing.Results.get_results!(token, checkid, opts)
  """
  def get_results!(token, id, opts, customerid \\ nil) do
    case NodePing.Results.get_results(token, id, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get uptime information for a check

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get uptime information about
  - `opts` - optional list of args for specifying the range of information to gather. Empty list for no opts
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `interval` - "days" or "months". "months" is the default
  - `start` - date/time for the start of the results. Timestamps should be milliseconds, or an RFC2822 or ISO 8601 date
  - `end` - date/time for the end of the results.

  ## Examples

      iex> opts = [{:interval, "days"}, {:start, "2020-02"}, {:end, "2020-05"}]
      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> {:ok, results} = NodePing.Results.get_results(token, checkid, opts)
  """
  def uptime(token, id, opts, customerid \\ nil) do
    querystrings =
      ([{:token, token}] ++ opts)
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @uptime_path <> "/#{id}" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get uptime information for a check

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get uptime information about
  - `opts` - optional list of args for specifying the range of information to gather. Empty list for no opts
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `interval` - "days" or "months". "months" is the default
  - `start` - date/time for the start of the results. Timestamps should be milliseconds, or an RFC2822 or ISO 8601 date
  - `end` - date/time for the end of the results.

  ## Examples

      iex> opts = [{:interval, "days"}, {:start, "2020-02"}, {:end, "2020-05"}]
      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> results = NodePing.Results.get_results(token, checkid, opts)
  """
  def uptime!(token, id, opts, customerid \\ nil) do
    case NodePing.Results.uptime(token, id, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Retrieves information about current "events" for checks. Events include down events
  and disabled checks. If you need a list of all checks with their passing/failing state,
  please use the 'checks' list rather than this 'current' call.

   ## Parameters

  - `token` - NodePing API token that was provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def current_events(token, customerid \\ nil) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> @current_path <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Retrieves information about current "events" for checks. Events include down events
  and disabled checks. If you need a list of all checks with their passing/failing state,
  please use the 'checks' list rather than this 'current' call.

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def current_events!(token, customerid \\ nil) do
    case NodePing.Results.current_events(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Retrieves information about "events" for checks. Events include down events and disabled checks.

  https://nodeping.com/docs-api-results.html#events

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get events for
  - `opts` - Optional list of tuples to specify returned results

  ## Opts

  - `start` - Start date to retrieve events from a specific range of time.
  - `end` - End date to retrieve events from a specific range of time.
  - `limit` - limit for the number of records to retrieve.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> start = "2020-06"
      iex> end = "2020-07"
      iex> limit = 10
      iex> opts = [{:start, start}, {:end, end}, {:limit, limit}]
      iex> {:ok, results} = NodePing.Results.get_events(token, checkid, opts)
  """
  def get_events(token, checkid, opts \\ []) do
    querystrings = Helpers.merge_querystrings([{:token, token}] ++ opts)

    (@api_url <> "/results/events/#{checkid}" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Retrieves information about "events" for checks. Events include down events and disabled checks.

  https://nodeping.com/docs-api-results.html#events

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - Check id of the check you want to get events for
  - `opts` - Optional list of tuples to specify returned results

  ## Opts

  - `start` - Start date to retrieve events from a specific range of time.
  - `end` - End date to retrieve events from a specific range of time.
  - `limit` - limit for the number of records to retrieve.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checkid = "201205050153W2Q4C-0J2HSIRF"
      iex> start = "2020-06"
      iex> end = "2020-07"
      iex> limit = 10
      iex> opts = [{:start, start}, {:end, end}, {:limit, limit}]
      iex> results = NodePing.Results.get_events!(token, checkid, opts)
  """
  def get_events!(token, checkid, opts \\ []) do
    case get_events(token, checkid, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
