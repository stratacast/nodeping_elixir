defmodule NodePing.Checktypes.HttpContent do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "HTTPCONTENT",
    invert: false,
    contentstring: nil,
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
