defmodule NodePing.Checktypes.Imap4 do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "IMAP4",
    port: 143,
    verify: true,
    email: nil,
    username: nil,
    password: nil,
    secure: nil,
    warningdays: false,
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 2,
    dep: nil,
    notifications: []
  ]

  @typedoc """
  IMAP field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    port: non_neg_integer(),
    verify: boolean(),
    email: nil | String.t(),
    username: nil | String.t(),
    password: nil | String.t(),
    secure: false | :ssl,
    warningdays: false | non_neg_integer(),
    interval: non_neg_integer(),
    enabled: boolean(),
    public: boolean(),
    runlocations: nil | [String.t()],
    homeloc: nil | String.t(),
    threshold: non_neg_integer(),
    sens: non_neg_integer(),
    dep: nil | String.t(),
    notifications: [map()]
  }
end
