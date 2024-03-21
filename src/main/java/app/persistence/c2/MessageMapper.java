package app.persistence.c2;

import app.c2.expandedEntities.MessageForHtml;
import app.controllers.c2.ChatserverController;
import app.entities.c2.Message;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;

import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

public class MessageMapper
{
    
    public static Map< Integer, MessageForHtml> getMessages(ConnectionPool connectionPool ) throws DatabaseException
    {
        String sql = "SELECT * FROM message ORDER BY message_id DESC LIMIT " + ChatserverController.MAX_MESSAGES + ";";
        Map< Integer, MessageForHtml > messageList = new LinkedHashMap<>();
        
        try (
                Connection connect = connectionPool.getConnection();
                PreparedStatement statement = connect.prepareStatement( sql )
        ) {
            
            ResultSet resultSet = statement.executeQuery();
            
            while ( resultSet.next() ) {
                MessageForHtml m = new MessageForHtml(); //TODO: Only use pure entity classes in mappers instead of the expanded class
                m.setMessageId( resultSet.getInt( "message_id" ) );
                m.setSender( resultSet.getString( "sender" ) );
                m.setMessage( resultSet.getString( "message" ) );
                m.setTime( resultSet.getString( "time" ) );
                m.setReceiver( resultSet.getString( "receiver" ) );
                
                messageList.put( m.getMessageId(), m );
            }
            
            return messageList;
            
        } catch ( SQLException exception ) {
            throw new DatabaseException( "A problem occured when acquiring data", exception.getMessage()  );
        }
    }
    
    public static Message createMessage( Message m, ConnectionPool connectionPool ) throws DatabaseException
    {
        String sql = "INSERT INTO message (sender, message, time, receiver) VALUES (?,?,?,?);";
        
        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement( sql, Statement.RETURN_GENERATED_KEYS )
        ) {
            ps.setString( 1, m.getSender() );
            ps.setString( 2, m.getMessage() );
            ps.setString( 3, m.getTime() );
            ps.setString( 4, m.getReceiver() );
            
            int rowsAffected = ps.executeUpdate();
            
            if ( rowsAffected != 1 ) {
                throw new DatabaseException( "Error when creating new message, multiple messages got created in DB?", "Creating a new message affected more than 1 row" );
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int messageId = rs.getInt( 1 );
            
            m.setMessageId( messageId );
            
            return m;
            
        } catch ( SQLException e ) {
            String msg = "An error occured. Try again";
            if ( e.getMessage().startsWith( "ERROR: invalid input " ) ) {
                msg = "Mistakes were made";
            }
            throw new DatabaseException( msg, e.getMessage() );
        }
    }
    
}
