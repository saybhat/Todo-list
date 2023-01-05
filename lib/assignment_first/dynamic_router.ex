import AssignmentFirst
defmodule Dynamic.Router do
  import Plug.Conn
  use Plug.Router
  require EEx
  plug :match
  plug :dispatch
  get "/" do
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/add" do
    conn = Plug.Conn.fetch_query_params(conn)
 		task = Map.fetch!(conn.params, "data")
    add(task)
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/delete" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "delete_data")
     delete_task(id)
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/edit3" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    task = Map.fetch!(conn.params, "data")
    priority=Map.fetch!(conn.params,"priority")
    body=EEx.eval_file "lib/assignment_first/edit.leex",[id: id,display: display() ,data: task,priority: priority]
    send_resp(conn, 200, body)
  end
  get "/edit" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    task = Map.fetch!(conn.params, "data")
    priority=Map.fetch!(conn.params,"priority")
    update_task(id,task,priority)
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/checked" do
    conn = Plug.Conn.fetch_query_params(conn)
    id = Map.fetch!(conn.params, "id")
 		status = Map.fetch!(conn.params, "status")

    toggle_status(id,status)
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/clear_all" do
    clearAll()
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end

  get "/with_more_details" do
    conn = Plug.Conn.fetch_query_params(conn)
 		task = Map.fetch!(conn.params, "data")
    priority=Map.fetch!(conn.params,"priority")
    add(task,priority)
    body=EEx.eval_file "lib/assignment_first/home.leex",[display: display()]
    send_resp(conn, 200, body)
  end

  get _ do
    send_resp(conn, 404, "ERROR!!")
  end

end
