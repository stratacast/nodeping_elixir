defmodule NodePing.Checktypes.Dns do
  defstruct [
    :target,
    label: "",
    type: "DNS",
    port: 53,
    transport: "udp",
    dnstype: "A",
    dnsrd: 1,
    verify: false,
    contentstring: nil,
    dnstoresolve: nil,
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
