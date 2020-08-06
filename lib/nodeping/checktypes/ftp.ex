defmodule NodePing.Checktypes.Ftp do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "FTP",
    port: 21,
    username: nil,
    password: nil,
    invert: false,
    contentstring: nil,
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
