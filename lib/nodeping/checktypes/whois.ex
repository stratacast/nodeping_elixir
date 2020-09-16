defmodule NodePing.Checktypes.Whois do
  @moduledoc """
  WHOIS Checks should be use to receive alerts before your domain expires.
  They should also be used to ensure your domain registrar has the proper
  nameservers configured for your domain. You can also use it to verify that
  your administrative and technical contacts haven't been tampered with (hijacked).

  https://nodeping.com/whois_check.html
  """
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
