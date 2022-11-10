defmodule NodePing.Checktypes.DohDot do
  @moduledoc false

  defstruct [
    :target,
    :dnstoresolve,
    label: "",
    autodiag: false,
    type: "DOHDOT",
    dohdot: "doh",
    method: "GET",
    statuscode: "200",
    sendheaders: %{},
    clientcert: "",
    verify: false,
    dnstype: "A",
    contentstring: "",
    edns: %{},
    ipv6: false,
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
    dnstoresolve: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    method: String.t(),
    statuscode: String.t(),
    sendheaders: map(),
    clientcert: String.t(),
    verify: boolean(),
    dnstype: String.t(),
    contentstring: nil | String.t(),
    edns: map(),
    ipv6: boolean(),
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
