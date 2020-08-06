defmodule NodePing.Checktypes.Port do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "PORT",
    port: nil,
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
