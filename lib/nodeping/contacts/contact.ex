defmodule NodePing.Contacts.Contact do
  @moduledoc """
  Struct for defining variables when creating a contact
  """
  defstruct name: nil,
            addresses: [],
            newaddresses: [],
            custrole: "view"
end
