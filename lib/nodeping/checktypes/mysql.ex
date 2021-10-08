defmodule NodePing.Checktypes.Mysql do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "MYSQL",
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
