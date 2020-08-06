defmodule NodePing.Checktypes.Rbl do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "RBL",
    ignore: nil,
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
