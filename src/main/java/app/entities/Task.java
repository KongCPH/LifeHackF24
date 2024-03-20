package app.entities;

/**
 *
 * Her er en javadoc kommentar
 * @author kong
 */
public class Task
{
    private int taskId;

    private String name;
    private boolean done;
    private int userId;

    public Task(int taskId, String name, boolean done, int userId)
    {
        this.taskId = taskId;
        this.name = name;
        this.done = done;
        this.userId = userId;
    }

    public int getTaskId()
    {
        return taskId;
    }

    public String getName()
    {
        return name;
    }

    public boolean isDone()
    {
        return done;
    }

    /**
     * User id kommer fra databasen
     * @return et autoinkrementeret id fra databasen
     */
    public int getUserId()
    {
        return userId;
    }

    @Override
    public String toString()
    {
        return "Task{" +
                "taskId=" + taskId +
                ", name='" + name + '\'' +
                ", done=" + done +
                ", userId=" + userId +
                '}';
    }
}
