defmodule NodePing.Maintenance do
  @moduledoc """
  Maintenance schedules are used for automating the disabling and re-enabling
  of checks on a schedule or for one-time use (ad-hoc). In the web site they
  are under Account Settings -> Maintenance.
  """

  alias NodePing.HttpRequests, as: HttpRequests
  alias NodePing.Helpers, as: Helpers

  @api_url "https://api.nodeping.com/api/1/maintenance"

  @doc """
  Create a scheduled or ad-hoc maintenance.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `duration` - The duration that the maintenance will run
  - `name` - the name for the maintenance
  - `checklist` - a list of check IDs that are a part of the maintenance
  - `opts` - `Map` of optional arguments for creating the maintenance
  - `cusotmerid` - optional ID to access a subaccount

  ## Opts

  - `id` - Set this to "ad-hoc" if you want an ad-hoc maintenance
  - `enabled` - for scheduled maintenance. Whether it should be enabled or disabled on creation
  - `cron` - cron string for when scheduled maintenance should start

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checklist = ["201911191441YC6SJ-4S9OJ78G","201911191441YC6SJ-XB5HUTG6"]
      iex> duration = 30
      iex> name = "ad-hoc maintenance"
      iex> opts = %{:id => "ad-hoc"}
      iex> {:ok, result} = NodePing.Maintenance.create(token, duration, name, checklist, opts)

      iex> name = "scheduled maintenance"
      iex> opts = %{:cron => "15 14 1 * *", :enabled => false}
      iex> {:ok, result} = NodePing.Maintenance.create(token, duration, name, checklist, opts)
  """
  def create(token, duration, name, checklist, opts, customerid \\ nil) do
    vars = %{:duration => duration, :name => name, :checklist => checklist}

    data = Map.merge(opts, vars)

    Helpers.add_cust_id([{:token, token}], customerid)
    |> Helpers.merge_querystrings()
    |> (&HttpRequests.post(@api_url <> &1, data)).()
  end

  @doc """
  Create a scheduled or ad-hoc maintenance.

  ## Parameters

  - `token` - NodePing API token that is provided with account
  - `duration` - The duration that the maintenance will run
  - `name` - the name for the maintenance
  - `checklist` - a list of check IDs that are a part of the maintenance
  - `opts` - `Map` of optional arguments for creating the maintenance
  - `cusotmerid` - optional ID to access a subaccount

  ## Opts

  - `id` - Set this to "ad-hoc" if you want an ad-hoc maintenance
  - `enabled` - for scheduled maintenance. Whether it should be enabled or disabled on creation
  - `cron` - cron string for when scheduled maintenance should start

  ## Examples

      iex> token = System.fetch_env!("TOKEN")
      iex> checklist = ["201911191441YC6SJ-4S9OJ78G","201911191441YC6SJ-XB5HUTG6"]
      iex> duration = 30
      iex> name = "ad-hoc maintenance"
      iex> opts = %{:id => "ad-hoc"}
      iex> result = NodePing.Maintenance.create(token, duration, name, checklist, opts)

      iex> name = "scheduled maintenance"
      iex> opts = %{:cron => "15 14 1 * *", :enabled => false}
      iex> result = NodePing.Maintenance.create(token, duration, name, checklist, opts)
  """
  def create!(token, duration, name, checklist, opts, customerid \\ nil) do
    case NodePing.Maintenance.create(token, duration, name, checklist, opts, customerid) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end
end
