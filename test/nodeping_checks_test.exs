defmodule NodePingChecksTest do
  use ExUnit.Case, async: false
  # doctest NodePingChecks

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

  test "get all checks", context do
    {:ok, result} = NodePing.Checks.get_checks(context[:token], context[:customerid])
    assert is_map(result)
  end
end
