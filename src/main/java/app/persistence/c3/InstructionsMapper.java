package app.persistence.c3;

import app.entities.User;
import app.entities.c3.Instructions;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InstructionsMapper
{

    public static List<Instructions> getAllInstructions(ConnectionPool connectionPool) throws DatabaseException
    {
        List<Instructions> instructionsList = new ArrayList<>();
        String sql = "select * from instructions";

        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {

                String name = rs.getString("name");
                String description = rs.getString("description");

                instructionsList.add(new Instructions(name, description));
            }
        }
        catch (SQLException e)
        {
            throw new DatabaseException("Fejl!!!!", e.getMessage());
        }
        return instructionsList;
    }
}