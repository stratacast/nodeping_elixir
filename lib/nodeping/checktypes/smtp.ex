defmodule NodePing.Checktypes.Smtp do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "SMTP",
    invert: false,
    port: 25,
    verify: true,
    email: nil,
    username: nil,
    password: nil,
    secure: false,
    warningdays: nil,
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
