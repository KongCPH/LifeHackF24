package app.c2.expandedEntities;

import app.entities.c2.Message;

import java.sql.Timestamp;
import java.util.Objects;

public class MessageForHtml extends Message
{
    
    public static final String ALL = "@AlL"; //Special receiver for when everyone should see a message!
    
    private static final String END_OF_SENDER = " -> ";
    private static final String END_OF_RECEIVER = ": ";
    
    public MessageForHtml()
    {
    }
    
    public MessageForHtml( Message message )
    {
        this.setMessageId( message.getMessageId() );
        this.setSender( message.getSender() );
        this.setMessage( message.getMessage() );
        this.setReceiver( message.getReceiver() );
        this.setTime( message.getTime() );
    }
    
    public String getMeta()  //Used in thymeleaf
    {
        long messageDate = 0L;
        String systemDateRaw = null;
        long systemDate = 0L;
        
        boolean isValid = true;
        
        try {
            if ( this.getTime() != null && this.getTime().length() == 19 ) {
                messageDate = Long.parseLong( this.getTime().substring( 0, 2 ) + this.getTime().substring( 3, 5 ) + this.getTime().substring( 6, 10 ) );
                systemDateRaw = String.valueOf( new Timestamp( System.currentTimeMillis() ) );
                systemDate = Long.parseLong( systemDateRaw.substring( 8, 10 ) + systemDateRaw.substring( 5, 7 ) + systemDateRaw.substring( 0, 4 ) );
            } else {
                isValid = false;
            }
        } catch ( RuntimeException e ) {
            isValid = false;
        }
        
        
        if ( Objects.equals( this.getReceiver(), ALL ) ) {
            
            if ( isValid && messageDate == systemDate ) {
                return this.getSender() + END_OF_RECEIVER + "Today at " + this.getTime().substring( 11 );
            }
            
            return this.getSender() + END_OF_RECEIVER + this.getTime();
            
        } else {
            if ( isValid && messageDate == systemDate ) {
                return this.getSender() + END_OF_SENDER + this.getReceiver() + END_OF_RECEIVER + "Today at " + this.getTime().substring( 11 );
            }
            
            return this.getSender() + END_OF_SENDER + this.getReceiver() + END_OF_RECEIVER + this.getTime();
        }
    }
//                ChatserverController.setTimeMessageReference( LocalDateTime.now().format( DateTimeFormatter.ofPattern( "ddMMyyyyHHmmss" ) ) );
//            ChatserverController.setCurrentSender( this.getSender() );
}
