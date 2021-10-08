defmodule NodePing.Checktypes.Agent do
  @moduledoc false

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
