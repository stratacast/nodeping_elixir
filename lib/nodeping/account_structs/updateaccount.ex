defmodule NodePing.Accounts.UpdateAccount do
  @moduledoc """
  Struct for updating a Nodeping account or subaccount
  """

  defstruct name: nil,
            timezone: nil,
            location: nil,
            emailme: nil,
            status: nil
end
