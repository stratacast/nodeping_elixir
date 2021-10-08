defmodule NodePing.Contacts do
  @moduledoc """
  Manage contacts on your NodePing account and subaccount.
  """

  import NodePing.HttpRequests
  import NodePing.Helpers

  @api_url "https://api.nodeping.com/api/1"

  @doc """
  Get all contacts on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, result} = NodePing.Contacts.get_all(token)
  """
  def get_all(token, customerid \\ nil) do
    add_cust_id([{:token, token}], customerid)
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/contacts" <> x end).()
    |> get()
  end

  @doc """
  Get all contacts on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> result = NodePing.Contacts.get_all!(token)
  """
  def get_all!(token, customerid \\ nil) do
    case get_all(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get a contact on your NodePing account or subaccount

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - contact ID for getting a single contact
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-BKPGH"
      iex> {:ok, result} = NodePing.Contacts.get_by_id(token, id)
  """
  def get_by_id(token, id, customerid \\ nil) do
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
  - `id` - contact ID for getting a single contact
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-BKPGH"
      iex> result = NodePing.Contacts.get_by_id!(token, id)
  """
  def get_by_id!(token, id, customerid \\ nil) do
    case get_by_id(token, id, customerid) do
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
  - `id` - The contact id
  - `args` - Arguments for creating a NodePing contact
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> updated_contact =
           %{
             "A775GC26" => %{
               address: "me@example.com",
               supressup: true,
               type: "email"
             }
           }
      iex> {:ok, updated} = NodePing.Contacts.update_contact(token, id, %{addresses: updated_contact})
  """
  def update_contact(token, id, args, customerid \\ nil) do
    querystrings =
      add_cust_id([{:token, token}], customerid)
      |> merge_querystrings()

    combine_map_struct(NodePing.Contacts.Contact, args)
    |> Map.drop([:newaddresses])
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
  - `id` - The contact id
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
      iex> updated = NodePing.Contacts.update_contact!(token, id, %{addresses: updated_contact})
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
  Mute a contact method for a specified durtion in seconds.
  Note that the contact has to be the ID in the "addresses" portion
  of a contact.

  NOTE: This makes a GET request to the API before doing a PUT

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - the ID for the contact method you want to mute
  - `duration` - time to mute the contact method in seconds
  - `customerid` - optional ID to access a subaccount
  """
  def mute_contact_method(token, id, duration, customerid \\ nil) do
    contacts = get_all!(token, customerid)

    {contact_id, addresses} =
      contacts
      |> Enum.find(fn {_, v} -> get_in(v, ["addresses", id]) != nil end)

    mute_time =
      DateTime.utc_now()
      |> DateTime.add(duration, :second)
      |> DateTime.to_unix(:millisecond)

    muted =
      addresses
      |> get_in(["addresses", id])
      |> Map.update("mute", mute_time, fn _x -> mute_time end)

    new_addresses =
      addresses
      |> Map.get("addresses")
      |> Map.replace(id, muted)

    NodePing.Contacts.update_contact!(token, contact_id, %{addresses: new_addresses}, customerid)
  end

  @doc """
  Mute a contact method for a specified durtion in seconds.
  Note that the contact has to be the ID in the "addresses" portion
  of a contact.

  NOTE: This makes a GET request to the API before doing a PUT

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - the ID for the contact method you want to mute
  - `duration` - time to mute the contact method in seconds
  - `customerid` - optional ID to access a subaccount
  """
  def mute_contact_method!(token, id, duration, customerid \\ nil) do
    case mute_contact_method(token, id, duration, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Mute an entire contact for a specified duration in seconds.
  Note that the contact has to be the ID (or _id) of the contact.

  NOTE: This makes a GET request to the API before doing a PUT

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - the ID for the contact you want to mute
  - `duration` - time to mute the contact method in seconds
  - `customerid` - optional ID to access a subaccount
  """
  def mute_contact(token, id, duration, customerid \\ nil) do
    mute_time =
      DateTime.utc_now()
      |> DateTime.add(duration, :second)
      |> DateTime.to_unix(:millisecond)

    addresses =
      get_by_id!(token, id, customerid)
      |> Map.get("addresses")
      |> Enum.map(fn {k, v} -> {k, Map.update(v, "mute", mute_time, fn _x -> mute_time end)} end)
      |> Enum.into(%{})

    NodePing.Contacts.update_contact!(token, id, %{addresses: addresses}, customerid)
  end
  @doc """

  Mute an entire contact for a specified duration in seconds.
  Note that the contact has to be the ID (or _id) of the contact.

  NOTE: This makes a GET request to the API before doing a PUT

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `id` - the ID for the contact you want to mute
  - `duration` - time to mute the contact method in seconds
  - `customerid` - optional ID to access a subaccount
  """
  def mute_contact!(token, id, duration, customerid \\ nil) do
    case mute_contact(token, id, duration, customerid) do
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
