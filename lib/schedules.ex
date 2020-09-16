defmodule NodePing.Schedules do
  @moduledoc """
  Schedules are used for setting time windows for notifications. This module
  manages schedules for your account/subaccounts
  """
  alias NodePing.Helpers, as: Helpers
  alias NodePing.HttpRequests, as: HttpRequests

  @api_url "https://api.nodeping.com/api/1/schedules"

  @doc """
  Get all schedules on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> {:ok, result} = NodePing.Schedules.get_all(token)
  """
  def get_all(token, customerid \\ nil) do
    Helpers.add_cust_id([{:token, token}], customerid)
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.get(@api_url <> &1)).()
  end

  @doc """
  Get all schedules on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> result = NodePing.Schedules.get_all!(token)
  """
  def get_all!(token, customerid \\ nil) do
    case get_all(token, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Get a schedule by its name (ID) on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - The name or ID you want to give your schedule
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> name = "My work schedule"
      iex> {:ok, result} = NodePing.Schedules.get_by_name(token, name)
  """
  def get_by_name(token, name, customerid \\ nil) do
    Helpers.add_cust_id([{:token, token}], customerid)
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.get(@api_url <> "/#{name}" <> &1)).()
  end

  @doc """
  Get a schedule by its name (ID) on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - The name or ID you want to give your schedule
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> name = "My work schedule"
      iex> result = NodePing.Schedules.get_by_name!(token, name)
  """
  def get_by_name!(token, name, customerid \\ nil) do
    case get_by_name(token, name, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Create a schedule for your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - The name or ID you want to give your schedule
  - `data` - `Map` containing schedule information
      - `time1` - start of time span
      - `time2` - end of time span
      - `exclude` - inverts the time span so it is all day except for the time between time1 and time2
      - `disabled` - disables notifications for this day
      - `allday` - enables notifications for the entire day
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "My Work Schedule"
      iex> data = %{
      "data" => %{
        "friday" => %{"exclude" => 1, "time1" => "6:00", "time2" => "18:00"},
        "monday" => %{"disabled" => true},
        "saturday" => %{"allday" => true},
        "sunday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "thursday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "tuesday" => %{"exclude" => 0, "time1" => "12:00", "time2" => "18:00"},
        "wednesday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"}
        }
      }
      iex> {:ok, result} = NodePing.Schedules.create(token, id, data)
  """
  def create(token, id, data, customerid \\ nil) do
    Helpers.add_cust_id([{:token, token}], customerid)
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.put(@api_url <> "/#{id}" <> &1, data)).()
  end

  @doc """
  Create a schedule for your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - The name or ID you want to give your schedule
  - `data` - `Map` containing schedule information
      - `time1` - start of time span
      - `time2` - end of time span
      - `exclude` - inverts the time span so it is all day except for the time between time1 and time2
      - `disabled` - disables notifications for this day
      - `allday` - enables notifications for the entire day
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "My Work Schedule"
      iex> data = %{
      "data" => %{
        "friday" => %{"exclude" => 1, "time1" => "6:00", "time2" => "18:00"},
        "monday" => %{"disabled" => true},
        "saturday" => %{"allday" => true},
        "sunday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "thursday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "tuesday" => %{"exclude" => 0, "time1" => "12:00", "time2" => "18:00"},
        "wednesday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"}
        }
      }
      iex> result = NodePing.Schedules.create!(token, id, data)
  """
  def create!(token, id, data, customerid \\ nil) do
    case create(token, id, data, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Create a schedule for your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - The name or ID you want to give your schedule
  - `data` - `Map` containing schedule information
      - `time1` - start of time span
      - `time2` - end of time span
      - `exclude` - inverts the time span so it is all day except for the time between time1 and time2
      - `disabled` - disables notifications for this day
      - `allday` - enables notifications for the entire day
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "My Work Schedule"
      iex> data = %{
      "data" => %{
        "friday" => %{"exclude" => 1, "time1" => "6:00", "time2" => "18:00"},
        "monday" => %{"disabled" => true},
        "saturday" => %{"allday" => true},
        "sunday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "thursday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "tuesday" => %{"exclude" => 0, "time1" => "12:00", "time2" => "18:00"},
        "wednesday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"}
        }
      }
      iex> {:ok, result} = NodePing.Schedules.update(token, id, data)
  """
  def update(token, id, data, customerid \\ nil) do
    # The calls are the same, so we can just use the create function
    create(token, id, data, customerid)
  end

  @doc """
  Create a schedule for your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `id` - The name or ID you want to give your schedule
  - `data` - `Map` containing schedule information
      - `time1` - start of time span
      - `time2` - end of time span
      - `exclude` - inverts the time span so it is all day except for the time between time1 and time2
      - `disabled` - disables notifications for this day
      - `allday` - enables notifications for the entire day
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> id = "My Work Schedule"
      iex> data = %{
      "data" => %{
        "friday" => %{"exclude" => 1, "time1" => "6:00", "time2" => "18:00"},
        "monday" => %{"disabled" => true},
        "saturday" => %{"allday" => true},
        "sunday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "thursday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"},
        "tuesday" => %{"exclude" => 0, "time1" => "12:00", "time2" => "18:00"},
        "wednesday" => %{"exclude" => 0, "time1" => "6:00", "time2" => "18:00"}
        }
      }
      iex> result = NodePing.Schedules.update!(token, id, data)
  """
  def update!(token, id, data, customerid \\ nil) do
    # The calls are the same, so we can just use the create function
    case create(token, id, data, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Delete a schedule by its name (ID) on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - The name or ID of the schedule to delete
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> name = "My work schedule"
      iex> {:ok, result} = NodePing.Schedules.delete(token, name)
  """
  def delete(token, name, customerid \\ nil) do
    Helpers.add_cust_id([{:token, token}], customerid)
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.delete(@api_url <> "/#{name}" <> &1)).()
  end

  @doc """
  Delete a schedule by its name (ID) on your account or subaccount

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `name` - The name or ID of the schedule to delete
  - `customerid` - optional ID to access a subaccount

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> name = "My work schedule"
      iex> result = NodePing.Schedules.delete!(token, name)
  """
  def delete!(token, name, customerid \\ nil) do
    case delete(token, name, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
