defmodule NodePing.Checktypes.HttpParse do
  @moduledoc """
  The check makes an HTTP GET call to a URL you specify and parses the JSON
  or text returned. It looks for fields you specify and then compares each
  value for those fields to an acceptable range you set for each. The check
  will PASS if the HTTP check returns a status code greater than 200 and less
  than 399 and all fields are present and within the ranges you specified.

  https://nodeping.com/http_parse_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "HTTPPARSE",
    fields: %{},
    sendheaders: %{},
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
