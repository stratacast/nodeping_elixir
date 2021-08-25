defmodule NodePing.Checktypes.Ssl do
  @moduledoc """
  NodePing's SSL checks are an important part of your secure server
  monitoring strategy. The check can be used to ensure the validity
  of your SSL certificates, ensure that your web servers are handling
  the certificate correctly, and warn you well before your certificates
  expire, giving you time to renew them.

  https://nodeping.com/ssl_check.html
  """
  @enforce_keys [:target]
  defstruct [
    :target,
    label: "",
    autodiag: false,
    type: "SSL",
    warningdays: nil,
    servername: nil,
    interval: 15,
    enabled: false,
    public: false,
    runlocations: nil,
    homeloc: false,
    threshold: 5,
    sens: 2,
    dep: nil,
    notifications: nil
  ]
end
