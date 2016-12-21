package mainPackage;

public class Todo {
    private int id;
    private String taskName;
    private String description;
    private String note;
    private boolean done;

    public Todo(String taskName, String description, String note, boolean done) {
        this.taskName = taskName;
        this.description = description;
        this.note = note;
        this.done = done;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaskName() {
        return this.taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNote() {
        return this.note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isDone() {
        return this.done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    @Override
    public String toString() {
        return "ID: " + this.id + "taskName: " + this.taskName + ", description: " + this.description + ", note: " + this.note + ", done: " + this.done;
    }
}