defmodule NodePing.Checktypes.HttpAdv do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "HTTPADV",
    invert: false,
    contentstring: nil,
    data: %{},
    method: nil,
    postdata: nil,
    receiveheaders: nil,
    sendheaders: nil,
    statuscode: 200,
    ipv6: false,
    follow: false,
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
