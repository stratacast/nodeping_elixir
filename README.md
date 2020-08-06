# Nodeping

An Elixir package for managing checks, schedules, contacts, etc. on your NodePing account.

This package is incomplete and doesn't support all the functionality provided by the NodePing API yet.
There are still a few features that aren't supported yet and module and function docs are still a work in
progress. This is also my first Elixir project, pull requests, issue reports, and code criticism are
appreciated. :)

## Installation

The package can be installed
by adding `nodeping` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nodeping, "~> 0.1.0"}
  ]
end
```

And run `mix deps.get`.

## Usage

You will need to create an account at https://nodeping.com and fetch your API token under Account `Settings -> API`.
This will be your API `token` that you provide to authenticate with the service and manage things such as checks.
If you want to manage `SubAccounts`, you can get the ID for that subaccount under `Account Settings -> SubAccounts`,
and the ID is next to the name.
