defmodule NodePing.Checktypes.Cluster do
  @moduledoc false

  @enforce_keys [:data]
  defstruct label: "",
            data: [],
            type: "CLUSTER",
            autodiag: false,
            interval: 15,
            enabled: false,
            public: false,
            runlocations: nil,
            homeloc: false,
            threshold: 5,
            sens: 2,
            notifications: []

  @typedoc """
  Cluster Check field types
  """
  @type t :: %__MODULE__{
    label: String.t() | nil,
    data: [String.t()],
    type: String.t(),
    autodiag: boolean(),
    interval: non_neg_integer(),
    enabled: boolean(),
    public: boolean(),
    runlocations: nil | [String.t()],
    homeloc: nil | String.t(),
    threshold: non_neg_integer(),
    sens: non_neg_integer(),
    notifications: [map()]
  }
end
