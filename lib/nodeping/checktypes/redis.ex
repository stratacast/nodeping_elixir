defmodule NodePing.Checktypes.Redis do
  @moduledoc false

  @enforce_keys [:target, :redistype]
  defstruct [
    :target,
    :redistype,
    label: "",
    autodiag: false,
    type: "REDIS",
    interval: 15,
    hosts: [],
    sentinelname: nil,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 5,
    dep: nil,
    notifications: nil
  ]

  @typedoc """
  Redis Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    redistype: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    interval: non_neg_integer(),
    hosts: list(),
    sentinelname: nil | String.t(),
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
