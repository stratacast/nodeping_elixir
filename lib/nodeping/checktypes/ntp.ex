defmodule NodePing.Checktypes.Ntp do
  @moduledoc """
  Use the NTP check when you want to monitor the uptime of your NTP servers or
  to receive alerts when private servers become publically available, as in the
  case of a failing firewall rule. The check can be configured to send you
  notifications if it's able to get a response or if it's not able to get a response.

  https://nodeping.com/ntp_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "NTP",
    port: 123,
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
end
