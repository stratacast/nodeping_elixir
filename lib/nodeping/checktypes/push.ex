defmodule NodePing.Checktypes.Push do
  @moduledoc false

  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "PUSH",
    fields: %{},
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
