

package app.entities;

import static app.entities.YdOgNydStatus.*;
public class YdOgNydTask {
    private int taskId;
    private String headline;
    private String description;
    private int points;
    private YdOgNydStatus status;
    private String user;
    private int userId;


    public YdOgNydTask(int taskId, String headline, String description, int points) {
        this.taskId = taskId;
        this.headline = headline;
        this.description = description;
        this.points = points;
        status = NEW;
    }

    public YdOgNydTask(int taskId, String headline, String description, int points, YdOgNydStatus status, int userId) {
        this.taskId = taskId;
        this.headline = headline;
        this.description = description;
        this.points = points;
        this.status = status;
        this.userId = userId;
    }

    public int getTaskId() {
        return taskId;
    }

    public String getHeadline() {
        return headline;
    }

    public String getDescription() {
        return description;
    }

    public int getPoints() {
        return points;
    }

    public YdOgNydStatus getStatus() {
        return status;
    }

    public String getUser() {
        return user;
    }

    public int getUserId() {
        return userId;
    }
}
