defmodule NodePing.Checktypes.HttpContent do
  @moduledoc """
  HTTP Content Checks are very similar to HTTP Checks, except that HTTP
  Content checks look for a specific word (string) in the data returned
  in the response in addition to checking the status code and response time.

  https://nodeping.com/http_content_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "HTTPCONTENT",
    invert: false,
    contentstring: nil,
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
