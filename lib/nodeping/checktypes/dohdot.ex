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
    sens: 2,
    dep: nil,
    notifications: []
  ]
end
