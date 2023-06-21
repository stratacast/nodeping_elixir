defmodule NodePing.Checktypes.HttpAdv do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "HTTPADV",
    invert: false,
    contentstring: nil,
    data: %{},
    clientcert: nil,
    method: nil,
    postdata: nil,
    receiveheaders: nil,
    sendheaders: nil,
    statuscode: 200,
    ipv6: false,
    follow: false,
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
  HTTP ADV Check field types
  """
  @type t :: %__MODULE__{
    target: String.t(),
    label: String.t() | nil,
    autodiag: boolean(),
    type: String.t(),
    invert: boolean(),
    contentstring: nil | String.t(),
    data: map(),
    clientcert: nil | String.t(),
    method: nil | String.t(),
    postdata: map(),
    receiveheaders: nil | map(),
    sendheaders: nil | map(),
    statuscode: non_neg_integer(),
    ipv6: boolean(),
    follow: boolean(),
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
