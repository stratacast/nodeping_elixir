defmodule NodePing.Checktypes.Push do
  @moduledoc """
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
