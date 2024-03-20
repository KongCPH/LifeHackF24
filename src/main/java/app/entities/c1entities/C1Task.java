package app.entities.c1entities;

public class C1Task {

    private int taskID;
    private String taskTitle;
    private String taskDescription;
    private String taskResponsible;
    private int userStoryID;
    private int lifeCycleID;
    private int teamID;

    public C1Task(int taskID, String taskTitle, String taskDescription, String taskResponsible, int lifeCycleID, int teamID) {
        this.taskID = taskID;
        this.taskTitle = taskTitle;
        this.taskDescription = taskDescription;
        this.taskResponsible = taskResponsible;
        this.lifeCycleID = lifeCycleID;
        this.teamID = teamID;
    }

    public C1Task(String taskTitle, String taskDescription, String taskResponsible, int teamID) {
        this.taskTitle = taskTitle;
        this.taskDescription = taskDescription;
        this.taskResponsible = taskResponsible;
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

    public String getTaskResponsible() {
        return taskResponsible;
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
                ", taskResponsible='" + taskResponsible + '\'' +
                ", userStoryID=" + userStoryID +
                ", lifeCycleID=" + lifeCycleID +
                ", teamID=" + teamID +
                '}';
    }
}
