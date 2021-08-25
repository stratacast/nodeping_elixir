defmodule NodePing.Checktypes.Sip do
  @moduledoc """
  NodePing's SIP monitoring can verify that your SIP server is responding
  to new requests. The check does not initiate a call, but rather tests that
  the the server accepts a SIP connection by sending the OPTIONS command and
  watching for the response. Even if your server does not support the OPTIONS
  command and returns an error, this indicates that the server is up and
  operating, so the check succeeds.

  https://nodeping.com/sip_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "SIP",
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
end
