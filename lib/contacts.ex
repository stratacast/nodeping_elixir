defmodule NodePing.Contacts do
  @moduledoc """
  Manage contacts on your NodePing account and subaccount.
  """

  import NodePing.HttpRequests
  import NodePing.Helpers

  @api_url "https://api.nodeping.com/api/1"

  @doc """
  Get contacts on your NodePing account or subaccount. Supply
  an optional `id` to get info for a single contact

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - (optional) contact ID for getting a single contact
  - `customerid` - optional ID to access a subaccount
  """
  def get_contacts(token, id \\ nil, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contacts/#{id}" <> x end).()
    |> get()
  end

  @doc """
  Get contacts on your NodePing account or subaccount. Supply
  an optional `id` to get info for a single contact

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - (optional) contact ID for getting a single contact
  - `customerid` - optional ID to access a subaccount
  """
  def get_contacts!(token, id \\ nil, customerid \\ nil) do
    case get_contacts(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Create a new contact for your account or subaccount.
  You can reference the fields by using the `NodePing.Contacts.Contact` struct

  View the documentation to see the structure for creating contacts:
  https://nodeping.com/docs-api-contacts.html#post-put

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `args` - Arguments for creating a NodePing contact
  - `customerid` - optional ID to access a subaccount
  """
  def create_contact(token, args, customerid \\ nil) do
    querystrings =
      add_cust_id([{:token, token}], customerid)
      |> merge_querystrings()

    combine_map_struct(NodePing.Contacts.Contact, args)
    |> Map.drop([:addresses])
    |> (&post(@api_url <> "/contacts" <> querystrings, &1)).()
  end

  @doc """
  Create a new contact for your account or subaccount.
  You can reference the fields by using the `NodePing.Contacts.Contact` struct

  View the documentation to see the structure for creating contacts:
  https://nodeping.com/docs-api-contacts.html#post-put

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `args` - Arguments for creating a NodePing contact
  - `customerid` - optional ID to access a subaccount
  """
  def create_contact!(token, args, customerid \\ nil) do
    case create_contact(token, args, customerid) do
      {:ok, result} -> result
      {error, error} -> error
    end
  end

  @doc """
  Update an existing contact for your account or subaccount.

  **NOTE** When updating a contact's addresses, you must provide
  the current list of addresses. Any missing addresses will be removed.

  You can reference the fields by using the `NodePing.Contacts.Contact` struct

  View the documentation to see the structure for creating contacts:
  https://nodeping.com/docs-api-contacts.html#post-put

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `args` - Arguments for creating a NodePing contact
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> existing_contacts =
           %{
             "A775GC26" => %{
               address: "me@example.com",
               supressup: true,
               type: "email"
             }
           }
  """
  def update_contact(token, id, args, customerid \\ nil) do
    querystrings =
      add_cust_id([{:token, token}], customerid)
      |> merge_querystrings()

    combine_map_struct(NodePing.Contacts.Contact, args)
    |> (&put(@api_url <> "/contacts/#{id}" <> querystrings, &1)).()
  end

  @doc """
  Update an existing contact for your account or subaccount.

  **NOTE** When updating a contact's addresses, you must provide
  the current list of addresses. Any missing addresses will be removed.

  You can reference the fields by using the `NodePing.Contacts.Contact` struct

  View the documentation to see the structure for creating contacts:
  https://nodeping.com/docs-api-contacts.html#post-put

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `args` - Arguments for creating a NodePing contact
  - `customerid` - optional ID to access a subaccount

  ## Examples

  iex> existing_contacts =
      iex> existing_contacts =
           %{
             "A775GC26" => %{
               address: "me@example.com",
               supressup: true,
               type: "email"
             }
           }
  """
  def update_contact!(token, id, args, customerid \\ nil) do
    case update_contact(token, id, args, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Delete an existing contact from your account or subaccount.

  Specify the ID of the contact to be deleted.

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - ID for contact that will be deleted
  - `customerid` - optional ID to access a subaccount
  """
  def delete_contact(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contacts/#{id}" <> x end).()
    |> delete()
  end

  @doc """
  Delete an existing contact from your account or subaccount.

  Specify the ID of the contact to be deleted.

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - ID for contact that will be deleted
  - `customerid` - optional ID to access a subaccount
  """
  def delete_contact!(token, id, customerid \\ nil) do
    case delete_contact(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Reset the password for a contact. The password will be emailed to
  the contact's email address.
  """
  def reset_password(token, id, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contacts/#{id}" <> x <> "&action=RESETPASSWORD" end).()
    |> get()
  end

  @doc """
  Reset the password for a contact. The password will be emailed to
  the contact's email address.
  """
  def reset_password!(token, id, customerid \\ nil) do
    case reset_password(token, id, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
