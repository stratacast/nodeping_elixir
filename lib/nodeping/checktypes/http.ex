defmodule NodePing.Checktypes.Http do
  @moduledoc """
  You should use HTTP checks anytime you want to know if a web page is up and
  responding normally. However, HTTP checks just look at the status of the
  response, not at the actual content of what is returned.

  https://nodeping.com/http_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "HTTP",
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
