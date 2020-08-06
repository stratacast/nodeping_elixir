defmodule NodePing.Checktypes.Http do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "HTTP",
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
end
