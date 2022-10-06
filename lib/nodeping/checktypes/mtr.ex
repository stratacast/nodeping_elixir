defmodule NodePing.Checktypes.Mtr do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    ipv6: false,
    type: "MTR",
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 5,
    dep: nil,
    notifications: nil
  ]
end
