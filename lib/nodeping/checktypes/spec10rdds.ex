defmodule NodePing.Checktypes.Spec10Rdds do
  @moduledoc false

  @enforce_keys [:target, :data]
  defstruct [
    :target,
    :data,
    label: "",
    autodiag: false,
    type: "SPEC10RDDS",
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
  spec10rdds Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    data: map(),
    label: String.t() | nil,
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
