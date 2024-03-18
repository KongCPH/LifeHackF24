package app.persistence;

import app.entities.YdOgNydStatus;
import app.entities.YdOgNydTask;
import app.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TaskMapper {

    public static YdOgNydTask createTask(String headline, String description, int points, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "insert into kong_task (headline, description, points) values (?,?)";

        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ps.setString(1, headline);
            ps.setString(2, description);
            ps.setInt(3, points);

            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                return new YdOgNydTask(rs.getInt("task_id"), headline, description, points);
            }
            else {
                throw new DatabaseException("Fejl ved oprettelse af ny task");
            }
        }
        catch (SQLException e)
        {
            String msg = "Der er sket en fejl. Prøv igen";


            throw new DatabaseException(msg, e.getMessage());
        }
    }

    public static YdOgNydTask updateTask(int taskId, YdOgNydStatus status, int userId, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "UPDATE kong_task SET status = ?, userId = ? WHERE user = ?";

        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ps.setString(1, status.toString());
            ps.setString(2, description);
            ps.setInt(3, points);

            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                return new YdOgNydTask(rs.getInt("task_id"), headline, description, points);
            }
            else {
                throw new DatabaseException("Fejl ved oprettelse af ny task");
            }
        }
        catch (SQLException e)
        {
            String msg = "Der er sket en fejl. Prøv igen";


            throw new DatabaseException(msg, e.getMessage());
        }
    }
}
