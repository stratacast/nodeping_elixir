defmodule NodePing.ContactGroups do
  @moduledoc """
  Manage contact groups on your NodePing account and subaccout.

  https://nodeping.com/docs-api-contactgroups.html
  """

  import NodePing.HttpRequests
  import NodePing.Helpers

  @api_url "https://api.nodeping.com/api/1"

  @doc """
  Get contact groups for your NodePing account or subaccount.
  """
  def get_all(token, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contactgroups" <> x end).()
    |> get()
  end

  def get_all!(token, customerid \\ nil) do
    case get_all(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def get_by_id(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contactgroups/#{id}" <> x end).()
    |> get()
  end

  def get_by_id!(token, id, customerid \\ nil) do
    case get_by_id(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def create_group(token, name, opts \\ []) do
    members = opts[:members] || nil
    customerid = opts[:customerid] || nil

    data =
      if is_nil(members) do
        %{:name => name}
      else
        %{:name => name, :members => members}
      end

    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (&post(@api_url <> "/contactgroups" <> &1, data)).()
  end

  def create_group!(token, name, opts \\ []) do
    case create_group(token, name, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def update_group(token, id, opts \\ []) do
    name = opts[:name] || nil
    members = opts[:members] || nil
    customerid = opts[:customerid] || nil

    data =
      if is_nil(members) do
        %{:name => name}
      else
        %{:name => name, :members => members}
      end

    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (&put(@api_url <> "/contactgroups/#{id}" <> &1, data)).()
  end

  def update_group!(token, id, opts \\ []) do
    case update_group(token, id, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def delete_group(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contactgroups/#{id}" <> x end).()
    |> delete()
  end

  def delete_group!(token, id, opts \\ []) do
    case delete_group(token, id, opts) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
