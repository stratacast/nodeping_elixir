defmodule NodePing.Accounts do
  @moduledoc """
  Manage your NodePing account and subaccounts
  """

  import NodePing.HttpRequests
  import NodePing.Helpers

  @api_url "https://api.nodeping.com/api/1"

  @doc """
  Get information about your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, result} = NodePing.Accounts.get_account(token)
      iex> is_map(result)
      true
  """
  def get_account(token, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/accounts" <> x end).()
    |> get()
  end

  @doc """
  Get information about your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> result = NodePing.Accounts.get_account!(token)
      iex> is_map(result)
      true
  """
  def get_account!(token, customerid \\ nil) do
    case get_account(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Create a subaccount for your NodePing account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `args` - A map of arguments for creating the subaccount

  The `NodePing.Accounts.SubAccount` can be used to create the map necessary
  for the `args` variable and the variables expected by the API to create a
  new subaccount.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> args = %{:contactname => "My Name", :email => "me@example.com", :timezone => "-7", :location => "name"}
      iex> {:ok, result} = NodePing.Accounts.create_subaccount(token, args)
      iex> is_map(result)
      true
  """
  def create_subaccount(token, args) do
    querystrings = merge_querystrings([{:token, token}])

    combine_map_struct(NodePing.Accounts.SubAccount, args)
    |> (&post(@api_url <> "/accounts" <> querystrings, &1)).()
  end

  @doc """
  Create a subaccount for your NodePing account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `args` - A map of arguments for creating the subaccount

  The `NodePing.Accounts.SubAccount` can be used to create the map necessary
  for the `args` variable and the variables expected by the API to create a
  new subaccount.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> args = %{:contactname => "My Name", :email => "me@example.com", :timezone => "-7", :location => "name"}
      iex> {:ok, result} = NodePing.Accounts.create_subaccount!(token, args)
      iex> is_map(result)
      true
  """
  def create_subaccount!(token, args) do
    case create_subaccount(token, args) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Update your NodePing account or subaccount details

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `args` - A map of arguments for creating the subaccount
  - `customerid` - An optional subaccount ID that will be updated instead of the main account

  The `NodePing.Accounts.SubAccount` can be used to create the map necessary
  for the `args` variable and the variables expected by the API to create a
  new subaccount.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> args = %{:name => "Contact Name", :email => "me2@example.com", :timezone => "-2"}
      iex> {:ok, result} = NodePing.Accounts.update_account(token, args)
      iex> result["timezone"] == "-2.0"
      true
  """
  def update_account(token, args, customerid \\ nil) do
    querystrings =
      add_cust_id([{:token, token}], customerid)
      |> merge_querystrings()

    Map.from_struct(NodePing.Accounts.UpdateAccount)
    |> Map.merge(args)
    |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
    |> Map.new()
    |> (&put(@api_url <> "/accounts" <> querystrings, &1)).()
  end

  @doc """
  Update your NodePing account or subaccount details

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `args` - A map of arguments for creating the subaccount
  - `customerid` - An optional subaccount ID that will be updated instead of the main account

  The `NodePing.Accounts.SubAccount` can be used to create the map necessary
  for the `args` variable and the variables expected by the API to create a
  new subaccount.

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> args = %{:name => "Contact Name", :email => "me2@example.com", :timezone => "-2"}
      iex> {:ok, result} = NodePing.Accounts.update_account!(token, args)
      iex> result["timezone"] == "-2.0"
      true
  """
  def update_account!(token, args, customerid \\ nil) do
    case update_account(token, args, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Delete your NodePing subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - The subaccount ID for the subaccount you want to delete

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> subaccount = System.fetch_env!("SUBACCOUNT")
      iex> {:ok, result} = NodePing.Accounts.delete_subaccount!(token, subaccount)
      iex> is_map(result)
      true
  """
  def delete_subaccount(token, customerid) do
    querystrings =
      add_cust_id([{:token, token}], customerid)
      |> merge_querystrings()

    delete(@api_url <> "/accounts" <> querystrings)
  end

  @doc """
  Delete your NodePing subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - The subaccount ID for the subaccount you want to delete

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> subaccount = System.fetch_env!("SUBACCOUNT")
      iex> {:ok, result} = NodePing.Accounts.delete_subaccount!(token, subaccount)
      iex> is_map(result)
      true
  """
  def delete_subaccount!(token, customerid) do
    case delete_subaccount(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Disable notifications on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `accountsupressall` - boolean value. true disables notifications, false enables them
  - `customerid` - optional customerid if you want to disable notifications on a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> subaccount = System.fetch_env!("SUBACCOUNT")
      iex> {:ok, result} = NodePing.Accounts.disable_notifications(token, true, subaccount)
  """
  def disable_notifications(token, accountsuppressall, customerid \\ nil)
      when is_boolean(accountsuppressall) do
    [{:token, token}, {:accountsuppressall, accountsuppressall}]
    |> add_cust_id(customerid)
    |> merge_querystrings()
    |> (&put(@api_url <> "/accounts" <> &1)).()
  end

  @doc """
  Disable notifications on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `accountsupressall` - boolean value. true disables notifications, false enables them
  - `customerid` - optional customerid if you want to disable notifications on a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> subaccount = System.fetch_env!("SUBACCOUNT")
      iex> {:ok, result} = NodePing.Accounts.disable_notifications!(token, true, subaccount)
  """
  def disable_notifications!(token, accountsuppressall, customerid \\ nil)
      when is_boolean(accountsuppressall) do
    case disable_notifications(token, accountsuppressall, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
