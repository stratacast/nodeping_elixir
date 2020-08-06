defmodule NodePing.Checktypes.Websocket do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "WEBSOCKET",
    invert: false,
    contentstring: nil,
    data: nil,
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
