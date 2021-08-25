defmodule NodePing.Checktypes.Ping do
  @moduledoc """
  You should use pings when you are checking availability of network devices
  like routers, and checking if a server is up independent of other services
  that are running on it. In some situations pings are preferable to HTTP checks
  because HTTP checks might appear in some statistics systems as hits on the web site.

  https://nodeping.com/ping_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "PING",
    ipv6: false,
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 2,
    dep: nil,
    notifications: nil
  ]
end
