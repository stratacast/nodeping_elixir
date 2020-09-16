defmodule NodePing.Checktypes.Cluster do
  @moduledoc """
  The Cluster Check allows you to group interdependent NodePing checks in order
  to get notifications and track availability of the group of checks as a
  whole, in addition to each component check individually.

  https://nodeping.com/cluster_check.html
  """
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
