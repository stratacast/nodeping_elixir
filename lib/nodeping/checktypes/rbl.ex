defmodule NodePing.Checktypes.Rbl do
  @moduledoc """
  RBL checks should be run for all servers that send email - including
  SMTP and web servers - on at least a daily basis. RBL check can test
  any ipv4 address or FQDN.

  https://nodeping.com/rbl_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "RBL",
    ignore: nil,
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
