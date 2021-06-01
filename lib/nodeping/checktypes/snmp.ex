defmodule NodePing.Checktypes.Snmp do
  @moduledoc """
  NodePing's SNMP checks support SNMPv1 and SNMPv2c and can track and alert
  on numeric OID return values, comparing them to a range. If the return value
  is less than or greater than your configured range, the check will fail and alerts will be sent.

  https://nodeping.com/snmp_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    :token,
    label: "",
    type: "SNMP",
    port: 161,
    fields: %{},
    snmpv: 1,
    snmpcom: "public",
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
