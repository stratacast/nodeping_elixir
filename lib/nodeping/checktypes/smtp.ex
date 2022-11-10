defmodule NodePing.Checktypes.Smtp do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "SMTP",
    invert: false,
    port: 25,
    verify: true,
    email: nil,
    username: nil,
    password: nil,
    secure: false,
    warningdays: nil,
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
  SMTP field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    invert: boolean(),
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
