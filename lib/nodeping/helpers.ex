defmodule NodePing.Helpers do
  @moduledoc """
  Helper functions for the inner workings of of elixir library for the NodePing API
  """

  @doc """
  Takes querystrings for a URL and merges them into a single string

  ## Parameters

  - `querystrings` - A list of tuples where the first value is an `Atom` for the key, and the second is the value

  ## Examples
      iex> NodePing.Helpers.merge_querystrings([{:hello, "world"}, {:sample, "data"}])
      "?hello=world&sample=data"
  """
  def merge_querystrings(querystrings) when is_list(querystrings) do
    querystrings
    |> Enum.reduce("", fn {k, v}, acc -> "&#{Atom.to_string(k)}=#{v}#{acc}" end)
    |> String.replace_leading("&", "?")
  end

  @doc """
  Add the customerid to a list if it is not nil
  """
  def add_cust_id(list, customerid) do
    if is_nil(customerid) do
      list
    else
      list ++ [{:customerid, customerid}]
    end
  end

  @doc """
  Combine a struct from a map
  """
  def combine_map_struct(struct, map) when is_map(map) do
    accepted_user_keys =
      Map.from_struct(struct)
      |> Map.keys()
      |> Enum.filter(fn x -> map[x] end)

    Enum.filter(map, fn {k, _v} -> Enum.member?(accepted_user_keys, k) end)
    |> Map.new()
    |> (&Map.merge(Map.from_struct(struct), &1)).()
    |> Map.new()
  end
end
