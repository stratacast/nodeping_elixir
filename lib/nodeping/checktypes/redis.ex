defmodule NodePing.Checktypes.Redis do
  @moduledoc false

  @enforce_keys [:target, :redistype]
  defstruct [
    :target,
    :redistype,
    label: "",
    autodiag: false,
    type: "REDIS",
    interval: 15,
    hosts: [],
    sentinelname: nil,
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
