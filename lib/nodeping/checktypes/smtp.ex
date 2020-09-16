defmodule NodePing.Checktypes.Smtp do
  @moduledoc """
  NodePing's SMTP checks are an important part of an overall server monitoring
  strategy. The checks can not only verify that your server is accepting email
  properly but that user logins and your SSL/TLS certificates are also
  functioning properly. You can check to make sure that your SMTP server
  is not an open relay.

  https://nodeping.com/smtp_check.html
  """
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
