defmodule NodePing.Checktypes.Spec10Dns do
  @moduledoc false

  @enforce_keys [:target, :data]
  defstruct [
    :target,
    :data,
    label: "",
    autodiag: false,
    type: "SPEC10DNS",
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
