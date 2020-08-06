defmodule NodePingTest do
  use ExUnit.Case, async: false
  # doctest NodePing

  setup do
    token = System.fetch_env!("TOKEN")

    customerid =
      if System.fetch_env!("SUBACCOUNT") == "" do
        nil
      else
        System.fetch_env!("SUBACCOUNT")
      end

    {:ok, token: token, customerid: customerid}
  end

  test "querystrings start with question mark" do
    strings = [{:hello, "hello"}, {:world, "world"}]
    assert String.starts_with?(NodePing.Helpers.merge_querystrings(strings), "?") == true
  end

  test "get probes from nodeping", context do
    {:ok, result} = NodePing.get_probe(context[:token])
    assert is_list(Map.keys(result)) == true
  end
end
