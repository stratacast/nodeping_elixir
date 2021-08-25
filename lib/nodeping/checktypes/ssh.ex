defmodule NodePing.Checktypes.Ssh do
  @moduledoc """
  NodePing's SSH checks can be used to ensure the availability of your SSH services.
  In addition, the check can be configured with optional response string matching
  that, when used in conjunction with a login script, can provide notifications
  for things like CPU utilization, memory availability, or disk usage.

  https://nodeping.com/ssh_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "SSH",
    invert: false,
    contentstring: nil,
    port: 22,
    username: nil,
    password: nil,
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
