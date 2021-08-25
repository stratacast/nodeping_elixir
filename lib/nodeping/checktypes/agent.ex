defmodule NodePing.Checktypes.Agent do
  @moduledoc """
  AGENT checks allow you to install a NodePing probe, installed and maintained
  by you and available only to your account, inside your private network that
  you can assign other NodePing checks to run on. For example, installing an
  AGENT on your LAN will allow you to create PING checks that can ensure
  internal devices are up and running in the 192.168.x.x address space.

  https://nodeping.com/agent_check.html
  """
  defstruct label: "",
            type: "AGENT",
            oldresultsfail: false,
            autodiag: false,
            interval: 1,
            enabled: false,
            public: false,
            threshold: 5,
            sens: 2,
            dep: nil,
            notifications: []
end
