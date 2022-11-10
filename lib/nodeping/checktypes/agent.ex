defmodule NodePing.Checktypes.Agent do
  @moduledoc false

  defstruct label: "",
            type: "AGENT",
            oldresultsfail: false,
            autodiag: false,
            interval: 1,
            enabled: false,
            public: false,
            threshold: 5,
            sens: 2,
            dep: nil,
            notifications: []

  @typedoc """
  Agent Check field types
  """
  @type t :: %__MODULE__{
    label: String.t() | nil,
    type: String.t(),
    oldresultsfail: boolean(),
    autodiag: boolean(),
    interval: non_neg_integer(),
    enabled: boolean(),
    public: boolean(),
    threshold: non_neg_integer(),
    sens: non_neg_integer(),
    dep: nil | String.t(),
    notifications: [map()]
  }
end
