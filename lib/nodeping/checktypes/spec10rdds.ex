defmodule NodePing.Checktypes.Spec10Rdds do
  @moduledoc """
  The Spec10RDDS check (S10RDDS) is designed to monitor WHOIS availability
  to the ICANN Registry Agreement, specification 10 requirements. It needs
  10+ NodePing WHOIS or HTTP Content checks configured for 10+ locations
  running at 5 minute intervals.

  If you're not a registrar, this isn't likely a useful check for you.
  You're probably looking for our regular WHOIS checks.

  https://nodeping.com/spec10rdds_check.html
  """
  @enforce_keys [:target, :data]
  defstruct [
    :target,
    :data,
    label: "",
    autodiag: false,
    type: "SPEC10RDDS",
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
