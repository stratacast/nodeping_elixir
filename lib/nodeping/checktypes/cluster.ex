defmodule NodePing.Checktypes.Cluster do
  @enforce_keys [:data]
  defstruct label: "",
            data: [],
            type: "CLUSTER",
            interval: 15,
            enabled: false,
            public: false,
            runlocations: nil,
            homeloc: false,
            threshold: 5,
            sens: 2,
            notifications: []
end
