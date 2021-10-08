defmodule NodePing.Accounts.UpdateAccount do
  @moduledoc false

  defstruct name: nil,
            timezone: nil,
            autodiagnotifications: false,
            location: nil,
            emailme: nil,
            status: nil
end
