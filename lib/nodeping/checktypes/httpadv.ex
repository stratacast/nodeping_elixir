defmodule NodePing.Checktypes.HttpAdv do
  @moduledoc """
  HTTP Advanced Checks are very similar to HTTP and HTTP Content checks,
  except that HTTP Advanced checks provide additional features for those
  who need more granular control of either the request or the response verification.

  https://nodeping.com/http_advanced_check.html
  """
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
