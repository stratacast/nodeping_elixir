defmodule NodePing.Checktypes.Sip do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
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
