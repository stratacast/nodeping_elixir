defmodule NodePing.Checktypes.Push do
  @moduledoc false

  defstruct [
    label: "",
    autodiag: false,
    type: "PUSH",
    fields: %{},
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
  Push Check field types
  """
  @type t :: %__MODULE__{
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    fields: map(),
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
