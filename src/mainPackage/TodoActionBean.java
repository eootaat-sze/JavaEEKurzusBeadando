package mainPackage;

import java.util.ArrayList;
import java.util.Iterator;

public class TodoActionBean {
    private static int id = 0;
    private static int count = 0;
    private static ArrayList<Todo> todos = new ArrayList<>();

    public TodoActionBean() {
        if (count == 0) {
            demoData();
            count++;
        }
    }

    public ArrayList<Todo> getTodos() {
        return this.todos;
    }

    public boolean addTodo(Todo t) {
        t.setId(id);
        System.out.println(id);
        this.id++;
        System.out.println(id);
        boolean ret = todos.add(t);
        for (int i = 0; i < todos.size(); i++) {
            System.out.println(todos.get(i));
        }

        return ret;
    }

    public boolean deleteTodo(Todo t) {
        Iterator<Todo> i = todos.iterator();
        Todo todo;
        while (i.hasNext()) {
            todo = i.next();
            if (todo.getId() == t.getId()) {
                i.remove();
                return true;
            }
        }

        return false;
    }

    public boolean changeTodo(Todo t) {
        Todo todo;
        Iterator<Todo> i = todos.iterator();
        System.out.println("id " + t.getId());

        while (i.hasNext()) {
            todo = i.next();
            if (todo.getId() == t.getId()) {
                todo.setTaskName(t.getTaskName());
                todo.setDescription(t.getDescription());
                todo.setNote(t.getNote());
                todo.setDone(t.isDone());
            }
        }

        return false;
    }

    public void demoData() {
        Todo t = new Todo("Programming", "Doing a home project", "No notes yet", false);
        t.setId(100);
        Todo todo = new Todo("Studying", "Let's learn something", "...", true);
        todo.setId(101);
        todos.add(t);
        todos.add(todo);
    }

}