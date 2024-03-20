package app.entities.c1entities;

public class C1Task {

    private int taskID;
    private String taskTitle;
    private String taskDescription;
    private String taskUser;
    private int userStoryID;
    private int lifeCycleID;
    private int teamID;

    public C1Task(int taskID, String taskTitle, String taskDescription, String taskUser, int lifeCycleID, int teamID) {
        this.taskID = taskID;
        this.taskTitle = taskTitle;
        this.taskDescription = taskDescription;
        this.taskUser = taskUser;
        this.lifeCycleID = lifeCycleID;
        this.teamID = teamID;
    }

    public C1Task(String taskTitle, String taskDescription, String taskUser, int teamID) {
        this.taskTitle = taskTitle;
        this.taskDescription = taskDescription;
        this.taskUser = taskUser;
        this.teamID = teamID;
    }

    public int getTaskID() {
        return taskID;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public String getTaskUser() {
        return taskUser;
    }

    public int getUserStoryID() {
        return userStoryID;
    }

    public int getLifeCycleID() {
        return lifeCycleID;
    }

    public int getTeamID() {
        return teamID;
    }

    @Override
    public String toString() {
        return "C1Task{" +
                "taskID=" + taskID +
                ", taskTitle='" + taskTitle + '\'' +
                ", taskDescription='" + taskDescription + '\'' +
                ", taskUser='" + taskUser + '\'' +
                ", userStoryID=" + userStoryID +
                ", lifeCycleID=" + lifeCycleID +
                ", teamID=" + teamID +
                '}';
    }
}
