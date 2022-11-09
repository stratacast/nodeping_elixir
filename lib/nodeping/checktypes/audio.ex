defmodule NodePing.Checktypes.Audio do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "AUDIO",
    verifyvolume: false,
    autodiag: false,
    volumemin: -45,
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
