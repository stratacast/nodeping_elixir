defmodule NodePing.Checktypes.Dns do
  @moduledoc """
  This check can do the following types of lookups: ANY, A, CNAME, MX, NS,
  PTR, SOA, and TXT. The NodePing checks also let you optionally look for
  specific information in the response sent back from the DNS server.

  https://nodeping.com/dns_check.html
  """
  defstruct [
    :target,
    label: "",
    type: "DNS",
    port: 53,
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
