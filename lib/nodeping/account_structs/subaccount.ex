defmodule NodePing.Accounts.SubAccount do
  @moduledoc """
  Struct for creating a NodePing subaccount
  """

  @enforce_keys [:contactname, :email, :timezone, :location]
  defstruct name: nil,
            contactname: nil,
            email: nil,
            timezone: nil,
            location: nil,
            emailme: false
end
