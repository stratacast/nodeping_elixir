defmodule NodePing.Checktypes.Sip do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    transport: false,
    autodiag: false,
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
