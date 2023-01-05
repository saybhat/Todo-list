import First.Repo
defmodule First.Task do
  use Ecto.Schema

  # the database schema

  schema "to_do" do
    field :task, :string
    field :status, :string
    field :priority, :string
  end



end
