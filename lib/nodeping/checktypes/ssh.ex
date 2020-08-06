defmodule NodePing.Checktypes.Ssh do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "SSH",
    invert: false,
    contentstring: nil,
    port: 22,
    username: nil,
    password: nil,
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
