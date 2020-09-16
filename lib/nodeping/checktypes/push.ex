defmodule NodePing.Checktypes.Push do
  @moduledoc """
  PUSH checks allow you to send heartbeats and metrics from your servers
  to NodePing. Use a PUSH check for things like monitoring your servers that
  are behind firewalls, tracking CPU load on your Windows SQL servers, or
  getting alerts before you run out of disk space on your web servers.

  fields = %{
    :apcupsd => %{
      :name => "apcupsd",
      :min => 1,
      :max => 1
    },
    :load1min => %{
      :name => "load1min",
      :min => 1,
      :max => 1
    }
  }

  https://nodeping.com/push_check.html
  """
  defstruct [
    :target,
    label: "",
    type: "PUSH",
    fields: %{},
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
