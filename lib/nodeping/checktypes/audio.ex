defmodule NodePing.Checktypes.Audio do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "AUDIO",
    verifyvolume: false,
    autodiag: false,
    volumemin: -45,
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
  Audio Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    type: String.t(),
    verifyvolume: boolean(),
    autodiag: boolean(),
    volumemin: integer(),
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
