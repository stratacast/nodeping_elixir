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
    sens: 2,
    dep: nil,
    notifications: []
  ]
end
