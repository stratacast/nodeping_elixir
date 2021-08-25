defmodule NodePing.Diagnostics do
  @moduledoc """
  Request diagnostic information from a probe or AGENT

  Different metrics types include mtr, ping, traceroute, dig, pageload/browserperf, and screenshot.

  **NOTE** AGENT locations do not support pageload and screenshot tools

  https://nodeping.com/docs-api-diagnostics.html
  """

  import NodePing.Helpers
  import NodePing.HttpRequests

  @api_url "https://api.nodeping.com/api/1"
  @default_timeout 60_000

  @doc """
  Get diagnostic information from a probe or agent

  ## Parameters

  - `token` - NodePing API token that was provided with account
  - `checkid` - Check id of the check you want to get diagnostics on
  - `location` - The probe or AGENT you want to gather metrics from
  - `tool` - The type of diagnostic you would like to run

  Tool options include:

  * mtr, ping, traceroute, dig, pageload, or screenshot

  **NOTE** AGENTs do not support browserperf or screenshot

  ## Opts

  - `target` - The URL, FQDN, or IP address you'd like to get diagnostics about
  - `dnsserver` - Used for the dig tool - the FQDN or IP address of the DNS server you'd like to query
  - `dnstype` - Used for the dig tool - the DNS record type for the query
  - `count` - Used for the following tools: mtr and ping

  The opts are a map where the key is an atom. For example,

  %{:target => "www.example.com", :count => 10}
  """
  def get(token, checkid, location, tool, opts \\ %{}) do
    required_opts = %{:token => token, :location => location, :tool => tool}

    Map.merge(required_opts, opts)
    |> Map.to_list()
    |> merge_querystrings()
    |> (fn x -> @api_url <> "/diagnostics/#{checkid}" <> x end).()
    |> get(@default_timeout)
  end
end
