package app.persistence.c1persistence;

import app.entities.c1entities.C1Team;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class C1TeamMapper {


    public static C1Team login(String teamName, String password, ConnectionPool connectionPool) throws DatabaseException {

        String sql = "SELECT * FROM c1_team WHERE name=? AND password=?";

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {


            ps.setString(1, teamName);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int teamId = rs.getInt("team_id");

                return new C1Team(teamId, teamName, password);
            } else {
                throw new DatabaseException("Error on login");
            }

        } catch (SQLException e) {
            throw new DatabaseException("DB error", e.getMessage());
        }
    }

    public static C1Team createAccount(String teamName, String password, ConnectionPool connectionPool) throws DatabaseException {

        String sql = "INSERT INTO c1_team (name, password) VALUES (?, ?)";

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {


            ps.setString(1, teamName);
            ps.setString(2, password);

            ps.executeUpdate();

            return login(teamName, password, connectionPool);

        } catch (SQLException e) {
            throw new DatabaseException("DB error", e.getMessage());
        }
    }


}

