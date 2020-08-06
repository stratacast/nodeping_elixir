defmodule NodePing.Checks do
  @moduledoc """
  Create, read, update, and delete NodePing checks for your account
  and subaccounts
  """

  alias NodePing.HttpRequests, as: HttpRequests
  alias NodePing.Helpers, as: Helpers

  @api_url "https://api.nodeping.com/api/1"

  # GET CHECKS SECTION

  @doc """
  Get all checks present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def get_checks(token, customerid \\ nil) when is_bitstring(token) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks" <> querystrings)
    |> HttpRequests.get()
  end

  @doc """
  Get all passings checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def get_passing_checks(token, customerid \\ nil) do
    {:ok, result} = get_checks(token, customerid)
    Enum.filter(result, fn {_k, v} -> v["state"] == 1 end)
  end

  @doc """
  Get all failing checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def get_failing_checks(token, customerid \\ nil) do
    {:ok, result} = get_checks(token, customerid)
    Enum.filter(result, fn {_k, v} -> v["state"] == 0 end)
  end

  @doc """
  Get all disabled checks present on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount
  """
  def get_disabled_checks(token, customerid \\ nil) do
    {:ok, result} = get_checks(token, customerid)
    Enum.filter(result, fn {_k, v} -> v["enable"] != "active" end)
  end

  @doc """
  Get the last result for a specified check

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to fetch the last result for
  - `customerid` - optional ID to access a subaccount
  """
  def get_last_result(token, id, customerid \\ nil) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks/#{id}" <> querystrings <> "&lastresult=true")
    |> HttpRequests.get()
  end

  @doc """
  Get information about a NodePing check

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - Check ID of the check you want to fetch information about
  - `customerid` - optional ID to access a subaccount
  """
  def get_by_id(token, id, customerid \\ nil) when is_bitstring(token) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks/#{id}" <> querystrings)
    |> HttpRequests.get()
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
    {:ok, result} = get_by_id(token, id, customerid)

    case result do
      %{"error" => _x} ->
        false

      %{"_id" => _x} ->
        true
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
  Update an existing check for your NodePing account or subaccount
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
  Delete a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount
  """
  def delete_check(token, id, customerid \\ nil) when is_bitstring(token) do
    querystrings =
      Helpers.add_cust_id([{:token, token}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks/#{id}" <> querystrings)
    |> HttpRequests.delete()
  end

  @doc """
  Disable a check present on your NodePing account or specified subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the check ID that you want to delete
  - `customerid` - optional ID to access a subaccount
  - `disableall` - boolean value. true = disable all, false = re-enable those checks
  - `opts` - a keyword list with keys of `:type`, `:label`, `:target` as possible options

  ## Examples
      iex> opts = [[:type, "PING"], [:target, "example.com"]]

  """
  def disable_all_checks(token, disableall, opts \\ [], customerid \\ nil)
      when is_boolean(disableall) do
    querystrings =
      Helpers.add_cust_id([{:token, token}] ++ opts ++ [{:disableall, disableall}], customerid)
      |> Helpers.merge_querystrings()

    (@api_url <> "/checks" <> querystrings)
    |> HttpRequests.put()
  end
end
