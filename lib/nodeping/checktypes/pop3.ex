defmodule NodePing.Checktypes.Pop3 do
  @moduledoc """
  POP monitoring is an important part of an overall email availability
  monitoring strategy. The checks can not only verify that your server
  is providing POP email retrieval properly but that user logins and your
  SSL/TLS certificates are also functioning properly.

  https://nodeping.com/pop_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
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
