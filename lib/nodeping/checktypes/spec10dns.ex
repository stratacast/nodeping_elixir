defmodule NodePing.Checktypes.Spec10Dns do
  @moduledoc """
  The Spec10DNS check (S10DNS) is designed to monitor DNS to the ICANN
  Registry Agreement, specification 10 requirements. It needs 20+ regular
  NodePing DNS checks configured for 20+ locations running at 1 minute intervals.

  If you're not a registrar, this isn't likely a useful check for you.
  You're probably looking for our regular DNS checks.

  https://nodeping.com/spec10dns_check.html
  """
  @enforce_keys [:target, :data]
  defstruct [
    :target,
    :data,
    label: "",
    type: "SPEC10DNS",
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
