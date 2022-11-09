defmodule NodePing.Checktypes.Dns do
  @moduledoc false

  defstruct [
    :target,
    label: "",
    type: "DNS",
    port: 53,
    autodiag: false,
    transport: "udp",
    dnstype: "A",
    dnsrd: 1,
    verify: false,
    dnssection: "answer",
    contentstring: nil,
    dnstoresolve: nil,
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
  DNS Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    type: String.t(),
    port: non_neg_integer(),
    autodiag: boolean(),
    transport: String.t(),
    dnstype: String.t(),
    dnsrd: non_neg_integer(),
    verify: boolean(),
    dnssection: String.t(),
    contentstring: nil | String.t(),
    dnstoresolve: nil | String.t(),
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
