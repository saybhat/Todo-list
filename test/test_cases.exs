defmodule AssignmentFirstTest do
  use ExUnit.Case
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(First.Repo)
  end


    test "adding..." do
    {:ok , output_struct} = AssignmentFirst.add("added task")
    assert  output_struct.task == "added task"
  end
  test "updating..." do
    {:ok , output_struct} = AssignmentFirst.update_task(104,"updated")
    assert  output_struct.task == "updated"
    assert  output_struct.id == 104
  end
  test "deleting..." do
    {:ok , output_struct} = AssignmentFirst.delete_task(99)
    assert  output_struct.id == 99
  end
  test "change status..." do
    {:ok , output_struct} = AssignmentFirst.toggle_status(99,"complete")
    assert  output_struct.id == 99
    assert  output_struct.status == "incomplete"
  end
  test "change status2" do
    {:ok , output_struct} = AssignmentFirst.toggle_status(99,"incomplete")
    assert  output_struct.id == 99
    assert  output_struct.status == "complete"
  end
end
