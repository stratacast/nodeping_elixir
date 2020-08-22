defmodule NodePing.ContactGroups do
  @moduledoc """
  Manage contact groups on your NodePing account and subaccout.

  https://nodeping.com/docs-api-contactgroups.html
  """

  import NodePing.HttpRequests
  import NodePing.Helpers

  @api_url "https://api.nodeping.com/api/1/contactgroups"

  @doc """
  Get contact groups for your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, result} = NodePing.ContactGroups.get_all(token)
  """
  def get_all(token, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> x end).()
    |> get()
  end

  @doc """
  Get contact groups for your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> result = NodePing.ContactGroups.get_all!(token)
  """
  def get_all!(token, customerid \\ nil) do
    case get_all(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> {:ok, result} = NodePing.ContactGroups.get_by_id(token, id)
  """
  def get_by_id(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/#{id}" <> x end).()
    |> get()
  end

  @doc """
  Get a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> result = NodePing.ContactGroups.get_by_id!(token, id)
  """
  def get_by_id!(token, id, customerid \\ nil) do
    case get_by_id(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Create a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional `Map` of parameters for new contact group
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `name` - A label for the group
  - `members` - A list of contact ids

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> members = ["9GJ7EHJX", "GFRWVKD9"]
      iex> opts = %{:name => "contactgroup name", :members => members}
      iex> {:ok, result} = NodePing.ContactGroups.create(token, opts)
  """
  def create(token, opts, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (&post(@api_url <> &1, opts)).()
  end

  @doc """
  Create a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `opts` - Optional `Map` of parameters for new contact group
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `name` - A label for the group
  - `members` - A list of contact ids

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> members = ["9GJ7EHJX", "GFRWVKD9"]
      iex> opts = %{:name => "contactgroup name", :members => members}
      iex> result = NodePing.ContactGroups.create!(token, opts)
  """
  def create!(token, opts, customerid \\ nil) do
    case create(token, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Update an existing contact group on your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `opts` - Optional `Map` of parameters for new contact group
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `name` - A label for the group
  - `members` - A list of contact ids

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> members = ["9GJ7EHJX", "GFRWVKD9"]
      iex> opts = %{:name => "contactgroup name", :members => members}
      iex> {:ok, result} = NodePing.ContactGroups.update(token, id, opts)
  """
  def update(token, id, opts, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (&put(@api_url <> "/#{id}" <> &1, opts)).()
  end

  @doc """
  Update an existing contact group on your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `opts` - Optional `Map` of parameters for new contact group
  - `customerid` - optional ID to access a subaccount

  ## Opts

  - `name` - A label for the group
  - `members` - A list of contact ids

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> members = ["9GJ7EHJX", "GFRWVKD9"]
      iex> opts = %{:name => "contactgroup name", :members => members}
      iex> result = NodePing.ContactGroups.update!(token, id, opts)
  """
  def update!(token, id, opts, customerid \\ nil) do
    case update(token, id, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Delete a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> {:ok, result} = NodePing.ContactGroups.delete(token, id)
  """
  def delete(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/#{id}" <> x end).()
    |> delete()
  end

  @doc """
  Delete a contact group from your NodePing account or subaccount.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for your contact group
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-G-3QJWG"
      iex> result = NodePing.ContactGroups.delete!(token, id)
  """
  def delete!(token, id, customerid \\ nil) do
    case delete(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
