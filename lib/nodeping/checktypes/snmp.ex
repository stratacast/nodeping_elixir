defmodule NodePing.Checktypes.Snmp do
  @enforce_keys [:target]
  defstruct [
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
