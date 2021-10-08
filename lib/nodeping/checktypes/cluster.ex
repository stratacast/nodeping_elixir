defmodule NodePing.Checktypes.Cluster do
  @moduledoc false

  @enforce_keys [:data]
  defstruct label: "",
            data: [],
            type: "CLUSTER",
            autodiag: false,
            interval: 15,
            enabled: false,
            public: false,
            runlocations: nil,
            homeloc: false,
            threshold: 5,
            sens: 2,
            notifications: []
end
