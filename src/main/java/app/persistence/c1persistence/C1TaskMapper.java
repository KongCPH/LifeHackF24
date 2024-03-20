package app.persistence.c1persistence;

import app.entities.c1entities.C1Task;
import app.entities.c1entities.C1Team;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class C1TaskMapper {

    public static void addTask(String taskName, String description, String user, int teamID, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "INSERT INTO c1_task (title, description, user, team_id) values (?,?,?,?)";
        /*C1Task newTask = null;

        try(Connection connection = connectionPool.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
                ) {
            ps.setString(1,taskName);
            ps.setString(2,description);
            ps.setString(3, user);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1){
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                int newID = rs.getInt(1);
                newTask = new C1Task(newID, taskName, description,"", 0, team.getTeamID());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }*/
        try(
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        ) {
            ps.setString(1, taskName);
            ps.setString(2, description);
            ps.setString(3, user);
            ps.setInt(4, teamID);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 1)
            {
                throw new DatabaseException("Fejl i opdatering af en task");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<C1Task> getAllTasksPerTeam(int team_id, ConnectionPool connectionPool) throws DatabaseException {

        List<C1Task> taskList = new ArrayList<>();
        String sql = "SELECT * FROM c1_task WHERE team_id = ? ORDER BY task_id";

        try(
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
                ) {
            ps.setInt(1, team_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("task_id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String user = rs.getString("user");
                int usId = rs.getInt("us_id");
                int lifecycleId = rs.getInt("lifecycle_id");
                taskList.add(new C1Task(id, title, description, user, lifecycleId, team_id));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return taskList;
    }

    public static void moveTask(int taskID, int lifeCycleID, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "UPDATE c1_task SET lifecycle_id = ? WHERE task_id = ?";

        try(
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        ) {
            ps.setInt(1, lifeCycleID);
            ps.setInt(2, taskID);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 1)
            {
                throw new DatabaseException("Fejl i opdatering af en task");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } // METHOD END




} // CLASS END
