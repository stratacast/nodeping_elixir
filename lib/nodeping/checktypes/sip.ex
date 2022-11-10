defmodule NodePing.Checktypes.Sip do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    transport: false,
    autodiag: false,
    type: "SIP",
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
  SIP Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    transport: false | String.t(),
    autodiag: boolean(),
    type: String.t(),
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
