defmodule NodePing do
  @moduledoc """
  A module for handling generic NodePing functionality
  """

  @doc """
  Returns whether or not your NodePing API token is valid
  """
  def token_valid?(token) do
    case NodePing.Accounts.get_account(token) do
      {:ok, _result} -> true
      {:error, _error} -> false
    end
  end
end
