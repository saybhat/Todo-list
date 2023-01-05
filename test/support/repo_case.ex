defmodule First.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias First.Repo

      import Ecto
      import Ecto.Query
      import First.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(First.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(First.Repo, {:shared, self()})
    end

    :ok
  end
end
