defmodule NodePing.Checks do
  @moduledoc """
  Create, read, update, and delete NodePing checks for your account
  and subaccounts
  """

  alias NodePing.Helpers, as: Helpers
  alias NodePing.HttpRequests, as: HttpRequests

  @api_url "https://api.nodeping.com/api/1"

  # GET CHECKS SECTION

  @doc """
  Get all checks present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results.

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> {:ok, result} = NodePing.Checks.get_checks(token, [{:customerid, customerid}])
  """
  def get_checks(token, opts \\ []) do
    querystrings = Helpers.merge_querystrings([{:token, token}] ++ opts)

    (@api_url <> "/checks" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get all checks present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results.

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> result = NodePing.Checks.get_checks!(token, [{:customerid, customerid}])
  """
  def get_checks!(token, opts \\ []) do
    case get_checks(token, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get many checks at once on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `checkids` - list of checkids that will be queried
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present, the checks uptimes wilwl be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checkids = ["201205050153W2Q4C-0J2HSIRF", "201205050153W2Q4C-4RZT8MLN"]
      iex> {:ok, result} = NodePing.Checks.get_many(token, checkids, [{:uptime, true}])
  """
  def get_many(token, checkids, opts \\ []) do
    ids = {:id, Enum.join(checkids, ",")}
    querystrings = Helpers.merge_querystrings([{:token, token}, ids] ++ opts)

    (@api_url <> "/checks" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get many checks at once on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `checkids` - list of checkids that will be queried
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present, the checks uptimes wilwl be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checkids = ["201205050153W2Q4C-0J2HSIRF", "201205050153W2Q4C-4RZT8MLN"]
      iex> result = NodePing.Checks.get_many!(token, checkids, [{:uptime, true}])
  """
  def get_many!(token, checkids, opts \\ []) do
    case get_many(token, checkids, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
   Get all passings checks present on your NodePing account or subaccount

   ## Parameters

   - `token` - NodePing API token that is provided with account
   - `opts` - Optional list of tuples to specify results

   ## Opts - list of tuples

   - `customerid` - optional ID to access a subaccount
   - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> passing_checks = NodePing.Checks.get_passing_checks(token, [{:uptime, true}])
  """
  def get_passing_checks(token, opts \\ []) do
    case get_checks(token, opts) do
      {:ok, result} -> {:ok, Enum.filter(result, fn {_k, v} -> v["state"] == 1 end)}
      {:error, error} -> error
    end
  end

  @doc """
   Get all passings checks present on your NodePing account or subaccount

   ## Parameters

   - `token` - NodePing API token that is provided with account
   - `opts` - Optional list of tuples to specify results

   ## Opts - list of tuples

   - `customerid` - optional ID to access a subaccount
   - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> passing_checks = NodePing.Checks.get_passing_checks!(token, [{:uptime, true}])
  """
  def get_passing_checks!(token, opts \\ []) do
    case get_passing_checks(token, opts) do
      {:ok, result} -> result
      error -> error
    end
  end

  @doc """
  Get all failing checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, failing_checks} = NodePing.Checks.get_failing_checks(token)
  """
  def get_failing_checks(token, opts \\ []) do
    case get_checks(token, opts) do
      {:ok, result} -> {:ok, Enum.filter(result, fn {_k, v} -> v["state"] == 0 end)}
      {:error, error} -> error
    end
  end

  @doc """
  Get all failing checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> failing_checks = NodePing.Checks.get_failing_checks!(token)
  """
  def get_failing_checks!(token, opts \\ []) do
    case get_failing_checks(token, opts) do
      {:ok, result} -> result
      error -> error
    end
  end

  @doc """
  Get all disabled checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  """
  def get_disabled_checks(token, opts \\ []) do
    case get_checks(token, opts) do
      {:ok, result} -> {:ok, Enum.filter(result, fn {_k, v} -> v["enable"] != "active" end)}
      {:error, error} -> error
    end
  end

  @doc """
  Get all disabled checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response

  """
  def get_disabled_checks!(token, opts \\ []) do
    case get_disabled_checks(token, opts) do
      {:ok, result} -> result
      error -> error
    end
  end

  @doc """
  Get the last result for a specified check

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to fetch the last result for
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response
  """
  def get_last_result(token, id, opts \\ []) do
    querystrings = Helpers.merge_querystrings([{:token, token}] ++ opts)

    (@api_url <> "/checks/#{id}" <> querystrings <> "&lastresult=true")
    |> HttpRequests.get()
  end

  @doc """
  Get the last result for a specified check

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to fetch the last result for
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response
  """
  def get_last_result!(token, id, opts \\ []) do
    case get_last_result(token, id, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get information about a NodePing check

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to fetch information about
  - `opts` - Optional list of tuples to specify results

  ## Opts - list of tuples

  - `customerid` - optional ID to access a subaccount
  - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response
  """
  def get_by_id(token, id, opts \\ []) do
    querystrings = Helpers.merge_querystrings([{:token, token}] ++ opts)

    (@api_url <> "/checks/#{id}" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
   Get information about a NodePing check

   ## Parameters

   - `token` - NodePing API token that is provided with account
   - `id` - Check ID of the check you want to fetch information about
   - `opts` - Optional list of tuples to specify results

   ## Opts - list of tuples

   - `customerid` - optional ID to access a subaccount
   - `uptime` - boolean - If this parameter is present the check's uptime will be added to the response
  """
  def get_by_id!(token, id, opts \\ []) do
    case get_by_id(token, id, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Find an already fetched map of NodePing checks for the one with a given ID

  ## Parameters

  - `check_map` - a map of checks already fetched from the NodePing API
  - `id` - Check ID of the check you want to fetch information about
  """
  def find_by_id(check_map, id) do
    Enum.filter(check_map, fn {k, _v} -> k == id end)
  end

  @doc """
  Find passing or failing checks in an already fetched map of NodePing checks

  ## Parameters

  - `check_map` - a map of checks already fetched from the NodePing API
  - `status` - an atom with the values `:passing` or `:failing`
  """
  def find_by_state(check_map, status \\ :passing) do
    if status == :passing do
      Enum.filter(check_map, fn {_k, v} -> v["state"] == 1 end)
    else
      Enum.filter(check_map, fn {_k, v} -> v["state"] == 0 end)
    end
  end

  @doc """
  Find whether a check exists or not. Returns true if present or false if nonexistent

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to verify is present or not
  - `customerid` - optional ID to access a subaccount
  """
  def check_exists?(token, id, customerid \\ nil) do
    {:ok, result} = get_by_id(token, id, [{:customerid, customerid}])

    case result do
      %{"error" => _x} -> false
      %{"_id" => _x} -> true
    end
  end

  # CREATE CHECKS SECTION

  @doc """
  Create a new check for your NodePing account or subaccount

  Create any of the listed NodePing checks at:
  `https://nodeping.com/docs-api-checks.html`
  and view the "Fields by check type" section to see which checks
  accept what fields.

  ## Parameters

   - `token` - NodePing API token that is provided with account
   - `checktype_struct` - the `NodePing.Checktypes` that defines the check you are trying to create
   - `args` - non-default parameters you want to set for creating your check
   - `customerid` - optional customerid for subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checktype = NodePing.Checktypes.Ping
      iex> args = %{label: "my label", target: "example.com", interval: 1, enabled: true}
      iex> NodePing.Checks.create_check(token, checktype, args)
  """
  def create_check(token, checktype_struct, args, customerid \\ nil) when is_map(args) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    default_fields = Map.from_struct(checktype_struct)
    # Get keys that user supplied that matches values in struct
    accepted_user_keys = Enum.filter(Map.keys(default_fields), fn x -> args[x] end)

    Enum.filter(args, fn {k, _v} -> Enum.member?(accepted_user_keys, k) end)
    |> Map.new()
    |> (&Map.merge(default_fields, &1)).()
    |> Map.new()
    |> (&HttpRequests.post(@api_url <> "/checks" <> querystrings, &1)).()
  end

  @doc """
  Create a new check for your NodePing account or subaccount

  Create any of the listed NodePing checks at:
  `https://nodeping.com/docs-api-checks.html`
  and view the "Fields by check type" section to see which checks
  accept what fields.

  ## Parameters

   - `token` - NodePing API token that is provided with account
   - `checktype_struct` - the `NodePing.Checktypes` that defines the check you are trying to create
   - `args` - non-default parameters you want to set for creating your check
   - `customerid` - optional customerid for subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checktype = NodePing.Checktypes.Ping
      iex> args = %{label: "my label", target: "example.com", interval: 1, enabled: true}
      iex> NodePing.Checks.create_check!(token, checktype, args)
  """
  def create_check!(token, checktype_struct, args, customerid \\ nil) when is_map(args) do
    case NodePing.Checks.create_check(token, checktype_struct, args, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Update an existing check for your NodePing account or subaccount
   ## Parameters

   - `token` - NodePing API token that is provided with account
   - `checktype_struct` - the `NodePing.Checktypes` that defines the check you are trying to create
   - `args` - non-default parameters you want to set for creating your check
   - `customerid` - optional customerid for subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> check_id = "201205050153W2Q4C-0J2HSIRF"
      iex> checktype = NodePing.Checktypes.Ping
      iex> args = %{label: "my label", target: "example.com", interval: 1, enabled: true}
      iex> NodePing.Checks.update_check(token, check_id, checktype, args)
  """
  def update_check(token, id, checktype_struct, args, customerid \\ nil) when is_map(args) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    default_fields = Map.from_struct(checktype_struct)
    # Get keys that user supplied that matches values in struct
    accepted_user_keys = Enum.filter(Map.keys(default_fields), fn x -> args[x] end)

    Enum.filter(args, fn {k, _v} -> Enum.member?(accepted_user_keys, k) end)
    |> Map.new()
    |> (&Map.merge(default_fields, &1)).()
    |> Map.new()
    |> (&HttpRequests.put(@api_url <> "/checks/#{id}" <> querystrings, &1)).()
  end

  @doc """
  Update an existing check for your NodePing account or subaccount
   ## Parameters

   - `token` - NodePing API token that is provided with account
   - `checktype_struct` - the `NodePing.Checktypes` that defines the check you are trying to create
   - `args` - non-default parameters you want to set for creating your check
   - `customerid` - optional customerid for subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> check_id = "201205050153W2Q4C-0J2HSIRF"
      iex> checktype = NodePing.Checktypes.Ping
      iex> args = %{label: "my label", target: "example.com", interval: 1, enabled: true}
      iex> NodePing.Checks.update_check!(token, check_id, checktype, args)
  """
  def update_check!(token, id, checktype_struct, args, customerid \\ nil) when is_map(args) do
    case NodePing.Checks.update_check(token, id, checktype_struct, args, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Delete a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> check_id = "201205050153W2Q4C-0J2HSIRF"
      iex> {:ok, result} = NodePing.Checks.delete_check(token, check_id)
  """
  def delete_check(token, id, customerid \\ nil) when is_bitstring(token) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks/#{id}" <> querystrings)
    |> HttpRequests.delete()
  end

  @doc """
  Delete a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> check_id = "201205050153W2Q4C-0J2HSIRF"
      iex> result = NodePing.Checks.delete_check!(token, check_id)
  """
  def delete_check!(token, id, customerid \\ nil) when is_bitstring(token) do
    case NodePing.Checks.delete_check(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Disable a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount
  - `disableall` - boolean value. true = disable all, false = re-enable those checks
  - `opts` - a keyword list with keys of `:type`, `:label`, `:target`, `:customerid` as possible options

  ## Examples
      iex> opts = [{:type, "PING"}, {:target, "example.com"}]
      iex> disableall = true
      iex> {:ok, result} = NodePing.Checks.disable_all_checks(token, disableall, opts)
  """
  def disable_all_checks(token, disableall, opts \\ []) do
    querystrings =
      (opts ++ [{:token, token}, {:disableall, disableall}])
      |> Helpers.merge_querystrings()
      |> URI.encode()

    (@api_url <> "/checks" <> querystrings)
    |> HttpRequests.put()
  end

  @doc """
  Disable a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount
  - `disableall` - boolean value. true = disable all, false = re-enable those checks
  - `opts` - a keyword list with keys of `:type`, `:label`, `:target`, `:customerid` as possible options

  ## Examples
      iex> opts = [{:type, "PING"}, {:target, "example.com"}]
      iex> disableall = true
      iex> result = NodePing.Checks.disable_all_checks!(token, disableall, opts)
  """
  def disable_all_checks!(token, disableall, opts \\ []) do
    case NodePing.Checks.disable_all_checks(token, disableall, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
