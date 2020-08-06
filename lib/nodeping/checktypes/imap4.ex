defmodule NodePing.Checktypes.Imap4 do
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    type: "IMAP4",
    port: 143,
    verify: true,
    email: nil,
    username: nil,
    password: nil,
    secure: nil,
    warningdays: false,
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
