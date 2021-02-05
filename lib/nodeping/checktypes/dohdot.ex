defmodule NodePing.Checktypes.DohDot do
  @moduledoc """
  Use NodePing's DoH/DoT check to ensure your DoH or DoT services are up and
  replying to queries. The optional abilities to verify the SSL certificates,
  send EDNS(0) OPT pseudo-records, and use TLS client certificates makes our
  DoH/DoT check extremely capable.

  https://nodeping.com/dohdot_check.html
  """
  defstruct [
    :target,
    :dnstoresolve,
    label: "",
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
