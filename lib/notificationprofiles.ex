defmodule NodePing.Notificationprofiles do
  @moduledoc """
  Manage notification profiles for a NodePing account

  https://nodeping.com/docs-api-notificationprofiles.html
  """

  alias NodePing.Helpers, as: Helpers
  alias NodePing.HttpRequests, as: HttpRequests

  @api_url "https://api.nodeping.com/api/1/notificationprofiles"

  @doc """
  Get a list of notification profiles for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, result} = NodePing.Notificationprofiles.get(token)
  """
  @spec get(token :: bitstring()) :: tuple()
  def get(token) do
    querystrings = Helpers.merge_querystrings([{:token, token}])
    url = "#{@api_url}#{querystrings}"
    HttpRequests.get(url)
  end

  @doc """
  Get a list of notification profiles for the subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> result = NodePing.Notificationprofiles.get(token)
  """
  @spec get!(token :: bitstring()) :: map()
  def get!(token) do
    case get(token) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Get a list of notification profiles for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> {:ok, result} = NodePing.Notificationprofiles.get(token, customerid)
  """
  @spec get(token :: bitstring(), customerid :: bitstring()) :: tuple()
  def get(token, customerid) do
    querystrings =
      [{:token, token}]
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    url = "#{@api_url}#{querystrings}"
    HttpRequests.get(url)
  end

  @doc """
  Get a list of notification profiles for the subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> result = NodePing.Notificationprofiles.get(token, customerid)
  """
  @spec get!(token :: bitstring(), customerid :: bitstring()) :: map()
  def get!(token, customerid) do
    case get(token, customerid) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Get information for the notification profile for an account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> {:ok, result} = NodePing.Notificationprofiles.get_id(token, id)
  """
  @spec get_id(token :: bitstring(), id :: bitstring()) :: tuple()
  def get_id(token, id) do
    querystrings = Helpers.merge_querystrings([{:token, token}, {:id, id}])
    url = "#{@api_url}#{querystrings}"
    HttpRequests.get(url)
  end

  @doc """
  Get information for the notification profile for an account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> result = NodePing.Notificationprofiles.get_id!(token, id)
  """
  @spec get_id!(token :: bitstring(), id :: bitstring()) :: map()
  def get_id!(token, id) do
    case get_id(token, id) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Get information for the notification profile for a subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> {:ok, result} = NodePing.Notificationprofiles.get_id(token, id, customerid)
  """
  @spec get_id(token :: bitstring(), id :: bitstring(), customerid :: bitstring()) :: tuple()
  def get_id(token, id, customerid) do
    querystrings =
      [{:token, token}, {:id, id}]
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    url = "#{@api_url}#{querystrings}"
    HttpRequests.get(url)
  end

  @doc """
  Get information for the notification profile for a subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> result = NodePing.Notificationprofiles.get_id(token, id, customerid)
  """
  @spec get_id!(token :: bitstring(), id :: bitstring(), customerid :: bitstring()) :: map()
  def get_id!(token, id, customerid) do
    case get_id(token, id, customerid) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> {:ok, result} = NodePing.Notificationprofiles.create(token, "profilename", notifications)
  """
  @spec create(token :: bitstring(), name :: bitstring(), notifications :: list()) :: tuple()
  def create(token, name, notifications) do
    data = %{:name => name, :notifications => notifications}
    querystrings = Helpers.merge_querystrings([{:token, token}])
    url = "#{@api_url}#{querystrings}"

    HttpRequests.post(url, data)
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> result = NodePing.Notificationprofiles.create!(token, "profilename", notifications)
  """
  @spec create!(
          token :: bitstring(),
          name :: bitstring(),
          notifications :: list()
        ) :: map()
  def create!(token, name, notifications) do
    case create(token, name, notifications) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> {:ok, result} = NodePing.Notificationprofiles.create(token, "profilename", notifications, customerid)
  """
  @spec create(
          token :: bitstring(),
          name :: bitstring(),
          notifications :: list(),
          customerid :: bitstring()
        ) :: tuple()
  def create(token, name, notifications, customerid) do
    data = %{:name => name, :notifications => notifications}

    querystrings =
      [{:token, token}]
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    url = "#{@api_url}#{querystrings}"

    HttpRequests.post(url, data)
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> result = NodePing.Notificationprofiles.create!(token, "profilename", notifications, customerid)
  """
  @spec create!(
          token :: bitstring(),
          name :: bitstring(),
          notifications :: list(),
          customerid :: bitstring()
        ) :: map()
  def create!(token, name, notifications, customerid) do
    case create(token, name, notifications, customerid) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> {:ok, result} = NodePing.Notificationprofiles.update(token, id, "profilename", notifications)
  """
  @spec update(
          token :: bitstring(),
          id :: bitstring(),
          name :: bitstring(),
          notifcations :: list()
        ) :: tuple()
  def update(token, id, name, notifications) do
    data = %{:name => name, :notifications => notifications}
    querystrings = Helpers.merge_querystrings([{:token, token}])
    url = "#{@api_url}/#{id}#{querystrings}"

    HttpRequests.put(url, data)
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> result = NodePing.Notificationprofiles.update!(token, id, "profilename", notifications)
  """
  @spec update!(
          token :: bitstring(),
          id :: bitstring(),
          name :: bitstring(),
          notifcations :: list()
        ) :: map()
  def update!(token, id, name, notifications) do
    case update(token, id, name, notifications) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> {:ok, result} = NodePing.Notificationprofiles.update(token, id, "profilename", notifications, customerid)
  """
  @spec update(
          token :: bitstring(),
          id :: bitstring(),
          name :: bitstring(),
          notifcations :: list(),
          customerid :: bitstring()
        ) :: tuple()
  def update(token, id, name, notifications, customerid) do
    data = %{:name => name, :notifications => notifications}

    querystrings =
      [{:token, token}]
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    url = "#{@api_url}/#{id}#{querystrings}"

    HttpRequests.put(url, data)
  end

  @doc """
  Create a notification profile for the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated
  - `name` - Name for the notification profile
  - `notifications` - list of maps containing the contact or group id, delay, and scheduling for notifications
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> notifications = [
         >   %{"contactkey1" => %{"delay" => 0, "schedule" => "schedule1"}},
         >   %{"contactkey2" => %{"delay" => 0, "schedule" => "schedule1"}},
         > ]
      iex> result = NodePing.Notificationprofiles.update!(token, id, "profilename", notifications, customerid)
  """
  @spec update!(
          token :: bitstring(),
          id :: bitstring(),
          name :: bitstring(),
          notifcations :: list(),
          customerid :: bitstring()
        ) :: map()
  def update!(token, id, name, notifications, customerid) do
    case update(token, id, name, notifications, customerid) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Delete a notification profile from the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> {:ok, result} = NodePing.Notificationprofiles.delete(token, id)
  """
  @spec delete(token :: bitstring(), id :: bitstring()) :: tuple()
  def delete(token, id) do
    querystrings = Helpers.merge_querystrings([{:token, token}])
    url = "#{@api_url}/#{id}#{querystrings}"

    HttpRequests.delete(url)
  end

  @doc """
  Delete a notification profile from the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> result = NodePing.Notificationprofiles.delete!(token, id)
  """
  @spec delete!(token :: bitstring(), id :: bitstring()) :: map()
  def delete!(token, id) do
    case delete(token, id) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end

  @doc """
  Delete a notification profile from the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> {:ok, result} = NodePing.Notificationprofiles.delete(token, id, customerid)
  """
  @spec delete(token :: bitstring(), id :: bitstring(), customerid :: bitstring()) :: tuple()
  def delete(token, id, customerid) do
    querystrings =
      [{:token, token}]
      |> Helpers.add_cust_id(customerid)
      |> Helpers.merge_querystrings()

    url = "#{@api_url}/#{id}#{querystrings}"

    HttpRequests.delete(url)
  end

  @doc """
  Delete a notification profile from the account

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - the ID for the notification profile being updated

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> customerid = System.fetch_env!("CUSTOMERID")
      iex> id = "201205050153W2Q4C-P-3QJWG"
      iex> result = NodePing.Notificationprofiles.delete!(token, id, customerid)
  """
  @spec delete!(token :: bitstring(), id :: bitstring(), customerid :: bitstring()) :: map()
  def delete!(token, id, customerid) do
    case delete(token, id, customerid) do
      {:ok, result} ->
        result

      {:error, error} ->
        error
    end
  end
end
