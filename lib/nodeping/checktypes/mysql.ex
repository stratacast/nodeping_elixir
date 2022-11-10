defmodule NodePing.Checktypes.Mysql do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "MYSQL",
    port: 3306,
    username: nil,
    password: nil,
    secure: false,
    ipv6: false,
    database: nil,
    query: nil,
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
  MYSQL Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    port: non_neg_integer(),
    username: String.t() | nil,
    password: String.t() | nil,
    secure: false | :ssl,
    ipv6: boolean(),
    database: nil | String.t(),
    query: String.t(),
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
