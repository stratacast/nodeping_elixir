defmodule NodePing.Accounts.SubAccount do
  @moduledoc false

  @enforce_keys [:contactname, :email, :timezone, :location]
  defstruct name: nil,
            contactname: nil,
            autodiagnotifications: false,
            email: nil,
            timezone: nil,
            location: nil,
            emailme: false
end
