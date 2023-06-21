defmodule NodePing.Checktypes.Mongodb do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "MONGODB",
    query: nil,
    fields: %{},
    database: nil,
    namespace: nil,
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
  MongoDB Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    query: String.t(),
    fields: map(),
    database: String.t(),
    namespace: String.t(),
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