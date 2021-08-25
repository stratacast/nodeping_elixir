defmodule NodePing.Checktypes.Ftp do
  @moduledoc """
  The FTP check not only alerts you when your FTP service stops functioning
  properly but will also optionally alert you to the absence or presence of
  any particular file on the service.

  https://nodeping.com/ftp_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
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
