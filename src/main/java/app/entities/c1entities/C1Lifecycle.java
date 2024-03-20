package app.entities.c1entities;

public class C1Lifecycle {

    private int lifeCycleID;
    private String lifeCycleName;

    public C1Lifecycle(int lifeCycleID, String lifeCycleName) {
        this.lifeCycleID = lifeCycleID;
        this.lifeCycleName = lifeCycleName;
    }

    public C1Lifecycle(String lifeCycleName) {
        this.lifeCycleName = lifeCycleName;
    }

    public int getLifeCycleID() {
        return lifeCycleID;
    }

    public String getLifeCycleName() {
        return lifeCycleName;
    }

    @Override
    public String toString() {
        return "C1Lifecycle{" +
                "lifeCycleID=" + lifeCycleID +
                ", lifeCycleName='" + lifeCycleName + '\'' +
                '}';
    }
}

