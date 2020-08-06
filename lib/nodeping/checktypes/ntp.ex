defmodule NodePing.Checktypes.Ntp do
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
