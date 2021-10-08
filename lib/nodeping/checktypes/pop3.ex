defmodule NodePing.Checktypes.Pop3 do
  @moduledoc false

  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "POP3",
    port: 110,
    verify: true,
    email: nil,
    username: nil,
    password: nil,
    secure: false,
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
