package app.entities.c1entities;

public class C1Team {

    private int teamID;
    private String teamName;
    private String teamPassword;

    public C1Team(int teamID, String teamName, String teamPassword) {
        this.teamID = teamID;
        this.teamName = teamName;
        this.teamPassword = teamPassword;
    }

    public C1Team(String teamName, String teamPassword) {
        this.teamName = teamName;
        this.teamPassword = teamPassword;
    }

    public int getTeamID() {
        return teamID;
    }

    public String getTeamName() {
        return teamName;
    }

    public String getTeamPassword() {
        return teamPassword;
    }

    @Override
    public String toString() {
        return "C1Team{" +
                "teamID=" + teamID +
                ", teamName='" + teamName + '\'' +
                ", teamPassword='" + teamPassword + '\'' +
                '}';
    }
}
