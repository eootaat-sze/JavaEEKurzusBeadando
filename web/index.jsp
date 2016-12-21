<%@ page import="java.util.Iterator" %>
<%@ page import="mainPackage.Todo" %>
<%@ page import="mainPackage.TodoActionBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Page title</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/style.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Dancing+Script"/>
    </head>
    <jsp:useBean id="actionBean" class="mainPackage.TodoActionBean"></jsp:useBean>
    <%
        if (request.getParameter("addTodo") != null) {

            String taskName = request.getParameter("taskName");
            String description = request.getParameter("description");
            String note = request.getParameter("note");
            boolean done = request.getParameter("done").equals("Yes");

            if (!taskName.equals("") && !description.equals("") && !note.equals("")) {
                Todo t = new Todo(taskName, description, note, done);
                actionBean.addTodo(t);
            }
        }

        if (request.getParameter("changeTodo") != null) {
            String taskName = request.getParameter("taskNameInChange");
            String description = request.getParameter("descriptionInChange");
            String note = request.getParameter("noteInChange");
            boolean done = request.getParameter("doneInChange").equals("Yes");
            int id = Integer.parseInt(request.getParameter("taskId"));

            if (!taskName.equals("") && !description.equals("") && !note.equals("")) {
                Todo t = new Todo(taskName, description, note, done);
                t.setId(id);
                actionBean.changeTodo(t);
            }
        }

        if (request.getParameter("deleteTodo") != null) {
            String taskName = request.getParameter("taskNameInChange");
            String description = request.getParameter("descriptionInChange");
            String note = request.getParameter("noteInChange");
            boolean done = request.getParameter("doneInChange").equals("Yes");
            int id = Integer.parseInt(request.getParameter("taskId"));

            if (!taskName.equals("") && !description.equals("") && !note.equals("")) {
                Todo t = new Todo(taskName, description, note, done);
                t.setId(id);
                actionBean.deleteTodo(t);
            }
        }
    %>
    <body>
    <div id="main">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#newTodo">
            New todo
        </button>

        <table id="todoTable" class="table">
            <tr>
                <th>Done?</th>
                <th>Task name</th>
                <th>Description</th>
                <th>Note</th>
                <th>ID</th>
            </tr>
            <!--
            <tr id="100">
                <td>No</td>
                <td>Programming</td>
                <td>Doing a home project</td>
                <td>No notes yet</td>
                <td>100</td>
            </tr>
            <tr id="101">
                <td>Yes</td>
                <td>Studying</td>
                <td>Let's learn some AI</td>
                <td>...</td>
                <td>101</td>
            </tr>
            -->
            <%
                Iterator<Todo> i = actionBean.getTodos().iterator();
                Todo t;
                while (i.hasNext()) {
                    t = i.next();
                    String done = t.isDone() ? "Yes" : "No";
            %>
            <tr id="<%=t.getId()%>">
                <td><%=done%></td>
                <td><%=t.getTaskName()%></td>
                <td><%=t.getDescription()%></td>
                <td><%=t.getNote()%></td>
                <td><%=t.getId()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <!-- Modal form -->
    <div class="modal fade" id="changeTodo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">Change todo</h4>
                </div>
                <div class="modal-body" id="content">
                    <form class="form-horizontal" method="post" action="index.jsp">
                        <div class="form-group">
                            <label for="taskName" class="col-sm-2 control-label">Task name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="taskNameInChange" name="taskNameInChange">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="descriptionInChange" name="descriptionInChange">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-sm-2 control-label">Note</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="noteInChange" name="noteInChange">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="done" class="col-sm-2 control-label">Done?</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="doneInChange" name="doneInChange">
                                    <option>Yes</option>
                                    <option>No</select>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="taskId" id="taskId"/>
                        <hr/>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" name="deleteTodo" class="btn btn-default" id="deleteBtn" value="Delete todo"/>
                                <input type="submit" name="changeTodo" class="btn btn-primary" value="Save changes"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newTodo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add new todo</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="index.jsp">
                        <div class="form-group">
                            <label for="taskName" class="col-sm-2 control-label">Task name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="taskName" name="taskName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="description" name="description">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-sm-2 control-label">Note</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="note" name="note">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="done" class="col-sm-2 control-label">Done?</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="done" name="done">
                                    <option>Yes</option>
                                    <option>No</select>
                                </select>
                            </div>
                        </div>
                        <hr/>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" name="addTodo" class="btn btn-primary" value="Add new todo"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="script/script.js"></script>
</html>
