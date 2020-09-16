defmodule NodePing.Checktypes.Port do
  @moduledoc """
  The Port Connect check performs a simple TCP network connect call on
  any port you specify. It's protocol agnostic and can be used against
  any number of TCP network services. It simply reports if a connection
  was possible or not. The check can be configured to send you notifications
  if it is able to connect or if it is unable to connect.

  https://nodeping.com/port_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "PORT",
    port: nil,
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
