defmodule NodePing.Checktypes.Spec10Rdds do
  @enforce_keys [:target, :data]
  defstruct [
    :target,
    :data,
    label: "",
    type: "SPEC10RDDS",
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
