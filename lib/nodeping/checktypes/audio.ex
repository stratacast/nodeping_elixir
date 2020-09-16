defmodule NodePing.Checktypes.Audio do
  @moduledoc """
  The audio check can monitor your Icecast and SHOUTcast audio streaming
  services as well as most other audio streams to ensure they're available
  (up) and optionally test the stream for dead air (low volume).

  https://nodeping.com/audio_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "AUDIO",
    verifyvolume: false,
    volumemin: -45,
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 2,
    deps: nil,
    notifications: []
  ]
end
