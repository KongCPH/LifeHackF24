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

    // denne metode returnere en liste af instructions
    public static List<Instructions> getAllInstructions(ConnectionPool connectionPool) throws DatabaseException
    {
        //Ny liste
        List<Instructions> instructionsList = new ArrayList<>();
        // sql-statement til at hente date fra DB
        String sql = "select * from instructions";

        try (
                //skab en connection til DB
                Connection connection = connectionPool.getConnection();
                //spørg DB med den forberedte sql-statement
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            //her fyres sql'en af og "fanges" i som et ResultSet
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                //dataen fra databasen trækkes ud i selvstændige instructions-objekter (name og description)
                String name = rs.getString("name");
                String description = rs.getString("description");
                //instruction-objekterne sattes på en liste
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