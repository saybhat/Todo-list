import First.Task
import Ecto.Query
import Ecto.Changeset
defmodule AssignmentFirst do
  @moduledoc """
  Documentation for `To-Do`. The functions here are used as helpers to ADD,DISPLAY, TOGGLE, UPDATE the data coming in from the user and then store it in the database
  """

  @doc """
    add: use to add a task.
  """
  def add(task,priority\\"medium") do
    add_task = %First.Task{task: task,status: "incomplete",priority: priority}
    First.Repo.insert(add_task)
  end

  @doc """
    display: use to display a task.
  """
  def display() do
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    _data=First.Repo.all(query)

  end

  @doc """
    changeset: use to change a task.
  """
  def changeset(task , params \\ %{}) do
    task
    |> Ecto.Changeset.cast(params , [:task,:status,:priority])
    |> Ecto.Changeset.validate_required([:task , :status,:priority])
  end

  @doc """
    toggle: use to toggle a task from complete to incomplete and vice-versa.
  """
  def toggle_status(id,status) do
    old_task=First.Task |> First.Repo.get(id)
    IO.inspect(old_task)
    if status=="complete" do
      old_task
      |> changeset(%{status: "complete"})
      |> First.Repo.update()
    else
      old_task
      |> changeset(%{status: "incomplete"})
      |> First.Repo.update()
    end
  end

  @doc """
    update: use to update a task.
  """
  def update_task(id,task,priority) do

    old_task=First.Task |> First.Repo.get(id)
    old_task
    |> changeset(%{task: task,priority: priority})
    |> First.Repo.update()
  end

  @doc """
    delete: use to delete a task.
  """
  def delete_task(id) do
    _old_task=First.Task |> First.Repo.get(id)
    |> First.Repo.delete()
  end

  @doc """
    clearall: use to delete all tasks from the database.
  """
  def clearAll do
    First.Repo.delete_all(First.Task)
  end



end
