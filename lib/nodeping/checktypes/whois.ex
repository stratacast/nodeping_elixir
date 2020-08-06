defmodule NodePing.Checktypes.Whois do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "WHOIS",
    ipv6: false,
    invert: false,
    contentstring: nil,
    warningdays: nil,
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
