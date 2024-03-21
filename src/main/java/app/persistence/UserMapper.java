package app.persistence;

import app.entities.User;
import app.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class UserMapper
{

    public static User login(String userName, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "select * from users where username=? and password=?";

        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ps.setString(1, userName);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                int id = rs.getInt("user_id");
                String role = rs.getString("role");
                return new User(id, userName, password, role);
            } else
            {
                throw new DatabaseException("Fejl i login. Prøv igen");
            }
        }
        catch (SQLException e)
        {
            throw new DatabaseException("DB fejl", e.getMessage());
        }
    }

    public static void createuser(String userName, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "insert into users (username, password) values (?,?)";

        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ps.setString(1, userName);
            ps.setString(2, password);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 1)
            {
                throw new DatabaseException("Fejl ved oprettelse af ny bruger");
            }
        }
        catch (SQLException e)
        {
            String msg = "Der er sket en fejl. Prøv igen";
            if (e.getMessage().startsWith("ERROR: duplicate key value "))
            {
                msg = "Brugernavnet findes allerede. Vælg et andet";
            }
            throw new DatabaseException(msg, e.getMessage());
        }
    }
    
    public static Map< String, User > c2GetAllUsers( ConnectionPool connectionPool ) throws DatabaseException
    {
        String sql = "SELECT * FROM users WHERE role != 'system';";
        
        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement( sql )
        ) {
            
            ResultSet rs = ps.executeQuery();
            
            Map< String, User > allUsers = new LinkedHashMap<>();
            User user;
            
            while ( rs.next() ) {
                
                int user_id = rs.getInt( "user_id" );
                String username = rs.getString( "username" );
                String password = rs.getString( "password" );
                String role = rs.getString( "role" );
                
                user = new User( user_id, username, password, role );
                allUsers.put( user.getUserName(), user );
            }
            
            return allUsers;
            
        } catch ( SQLException e ) {
            throw new DatabaseException( "DB fejl", e.getMessage() );
        }
    }
}