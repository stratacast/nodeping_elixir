defmodule NodePing.Checktypes.Websocket do
  @moduledoc """
  WebSocket checks should be used to monitor the availability of WebSocket
  services. It can optionally send a string 'message' to the websocket as
  part of the check and also verify that any return data either contains or
  does not contain a particular text. For instance, you can have the WebSocket
  check send 'mycustomcall' to your WebSocket service and verify that the
  response from service contains 'you must log in'.

  https://nodeping.com/websocket_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "WEBSOCKET",
    invert: false,
    contentstring: nil,
    data: nil,
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 2,
    dep: nil,
    notifications: nil
  ]
end
