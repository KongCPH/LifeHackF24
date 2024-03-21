package app.controllers.c2;

import app.c2.constants.*;
import app.c2.expandedEntities.MessageForHtml;
import app.entities.User;
import app.entities.c2.Message;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.UserMapper;
import app.persistence.c2.MessageMapper;
import io.javalin.Javalin;
import io.javalin.config.JavalinConfig;
import io.javalin.http.Context;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class ChatserverController
{
    
    private static Thread onlineCheckThread; //Here, as we gotta be able to stop it later afterall :)
    private static final int ONLINE_CHECK_INTERVAL = 10000; //How often we check if people are still online
    private static final int ONLINE_TIMEOUT = 300000; //300000 = 5 minutes
    private static final String SYSTEM = "SYSTEM";
    private static final String USER = "USER '";
    private static final String USER_LEFT = "' LEFT";
    private static final String USER_JOINED = "' JOINED";
    
    
    
    private static int BACKUP_ID = 0; //In case the database has gone down
    
    private static final CurrentlyOnline C2_FRONTPAGE = new CurrentlyOnline(); //The text on the frontpage for our site :)
    private static final Set< String > C2_OFFLINE = new TreeSet<>(); //username
    private static final Set< String > C2_ONLINE = new TreeSet<>(); //username
    private static final Map< String, Long > C2_LAST_KNOWN_ACTIVITY_BY_USERNAME = new LinkedHashMap<>(); //username, timeInMS
    
    
    public static final int MAX_MESSAGES = 500; //Affects both fetching from database and the max size of the map below
    private static final Map< Integer, MessageForHtml > C2_ALL_MESSAGES = new TreeMap<>( Comparator.reverseOrder() ); //message_id, message
    private static int tailMessageId;
    
    
    //Routing-----------------------------------------------------
    public static void c2AddRoutes( Javalin app, ConnectionPool connectionPool )
    {
        //Fix our message on the front page
        app.before( "", ctx -> beforeFrontpage( ctx ) );
        app.before( "/", ctx -> beforeFrontpage( ctx ) );
        app.before( "login", ctx -> beforeFrontpage( ctx ) );
        app.before( "createuser", ctx -> beforeFrontpage( ctx ) );
        
        //Refresh our page
        app.get( Pages.indexPage, ctx -> index( ctx, connectionPool ) );
        
        //Post message
        app.post( Pages.c2SendPage, ctx -> indexSend( ctx, connectionPool ) );
        
        
    }
    
    //Routes------------------------------------------------------
    private static void beforeFrontpage( Context ctx ) //Our custom frontpage info needs this
    {
        if ( ctx.sessionAttribute( CtxSessionAttributes.c2Frontpage ) == null ) { //TODO: Figure out a way to make this a global attribute/data shared between all users
            ctx.sessionAttribute( CtxSessionAttributes.c2Frontpage, C2_FRONTPAGE );
        }
        
    }
    
    
    
    private static void indexRedirect( Context ctx ) //Go load the page
    {
        ctx.redirect( Pages.indexPage );
    }
    
    private static void index( Context ctx, ConnectionPool connectionPool ) //Loaded the page
    {
        if ( ctx.sessionAttribute( CtxSessionAttributes.currentUser ) == null ) {
            notLoggedInHandler( ctx );
            return;
        }
        
        if ( ctx.sessionAttribute( CtxSessionAttributes.c2AllMessages ) == null ) { //TODO: Figure out a way to make this a global attribute/data shared between all users
            ctx.sessionAttribute( CtxSessionAttributes.c2AllMessages, C2_ALL_MESSAGES );
        }
        
        if ( ctx.sessionAttribute( CtxSessionAttributes.c2LastKnownActivityByUsername ) == null ) { //TODO: Figure out a way to make this a global attribute/data shared between all users
            ctx.sessionAttribute( CtxSessionAttributes.c2LastKnownActivityByUsername, C2_LAST_KNOWN_ACTIVITY_BY_USERNAME );
        }
        
        if ( ctx.sessionAttribute( CtxSessionAttributes.c2Online ) == null ) { //TODO: Figure out a way to make this a global attribute/data shared between all users
            ctx.sessionAttribute( CtxSessionAttributes.c2Online, C2_ONLINE );
        }
        
        if ( ctx.sessionAttribute( CtxSessionAttributes.c2Offline ) == null ) { //TODO: Figure out a way to make this a global attribute/data shared between all users
            ctx.sessionAttribute( CtxSessionAttributes.c2Offline, C2_OFFLINE );
        }
        
        updateLastKnownActivity( ctx, connectionPool );
        
        ctx.render( Html.indexFile );
    }
    
    
    
    private static void indexSend( Context ctx, ConnectionPool connectionPool ) //Clicked the send button
    {
        if ( ctx.sessionAttribute( CtxSessionAttributes.currentUser ) == null ) {
            notLoggedInHandler( ctx );
            return;
        }
        
        updateLastKnownActivity( ctx, connectionPool );
        
        MessageForHtml messageForHtml = new MessageForHtml();
        messageForHtml.setMessage( ctx.formParam( FormParam.c2NewMessageMessage ) );
        messageForHtml.setSender( ctx.formParam( FormParam.c2NewMessageSender ) );
        messageForHtml.setReceiver( ctx.formParam( FormParam.c2NewMessageReceiver ) );
        messageForHtml.setTime( getTime() );
        
        
        addMessageForHtml( connectionPool, messageForHtml );
        
        
        
        indexRedirect( ctx );
    }
    
    
    
    
    //Helpers------------------------------------
    private static synchronized void addMessageForHtml( ConnectionPool connectionPool, MessageForHtml messageForHtml ) //Send it away boss!
    {
        Message dataBaseMessage;
        
        try {
            dataBaseMessage = MessageMapper.createMessage( messageForHtml, connectionPool );
            
        } catch ( DatabaseException e ) {
            //Oh no! Well, we already printed the message to console.
            //Just continue and use the backup ID system and hope for the best
            
            //We can't use ctx, so a bit difficult to inform the user of this
            
            while ( C2_ALL_MESSAGES.containsKey( BACKUP_ID ) ) {
                BACKUP_ID++;
            }
            
            dataBaseMessage = new MessageForHtml();
            dataBaseMessage.setMessageId( BACKUP_ID );
        }
        
        messageForHtml.setMessageId( dataBaseMessage.getMessageId() );
        
        putMessage( messageForHtml );
        
        if ( Objects.equals( messageForHtml.getSender(), SYSTEM ) ) {
            System.out.println( Info.PROJECT_NAME + ": " + messageForHtml.getMessage() );
        }
    }
    
    private static synchronized void updateLastKnownActivity( Context ctx, ConnectionPool connectionPool ) //We saw you, time to write that down
    {
        User currentUser = ctx.sessionAttribute( CtxSessionAttributes.currentUser );
        
        if ( currentUser == null ) {
            notLoggedInHandler( ctx );
            return;
        }
        
        C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.remove( currentUser.getUserName() );
        C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.put( currentUser.getUserName(), System.currentTimeMillis() );
        
        C2_OFFLINE.remove( currentUser.getUserName() );
        boolean wasNotOnline = C2_ONLINE.add( currentUser.getUserName() );
        
        if ( wasNotOnline ) {
            MessageForHtml messageForHtml = new MessageForHtml();
            messageForHtml.setSender( SYSTEM );
            messageForHtml.setMessage( USER + currentUser.getUserName() + USER_JOINED );
            messageForHtml.setReceiver( MessageForHtml.ALL );
            messageForHtml.setTime( getTime() );
            
            addMessageForHtml( connectionPool, messageForHtml );
        }
        
    }
    
    
    
    private static void notLoggedInHandler( Context ctx ) //For when currentUser == null
    {
        ctx.attribute( CtxAttributes.message, "You must be logged in to chat" );
        beforeFrontpage( ctx );
        ctx.render( "../templates/index" );
    }
    
    private static String getTime()
    {
        return LocalDateTime.now().format( DateTimeFormatter.ofPattern( "dd-MM-yyyy HH:mm:ss" ) );
    }
    
    private static synchronized void putMessage( MessageForHtml messageForHtml )
    {
        if ( C2_ALL_MESSAGES.size() == MAX_MESSAGES ) { //No more than this amount of messages loaded pls!
            C2_ALL_MESSAGES.remove( tailMessageId );
            tailMessageId++;
        }
        
        C2_ALL_MESSAGES.put( messageForHtml.getMessageId(), messageForHtml );

//        System.out.println( "Message ID " + messageForHtml.getMessageId() + " last element: " + lastElement + " size: " + C2_ALL_MESSAGES.size() );
    }
    
    
    
    
    
    //Startup Only----------------------------------------------------------
    public static void c2Start( JavalinConfig config, ConnectionPool connectionPool )
    {
        //Get all users from DB and put them in offline
        try {
            Map< String, User > users = UserMapper.c2GetAllUsers( connectionPool );
            
            for ( String username : users.keySet() ) {
                ChatserverController.C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.put( username, 0L );
            }
            
            ChatserverController.C2_OFFLINE.addAll( ChatserverController.C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.keySet() );
            
        } catch ( DatabaseException e ) {
            //Oh no! Well, we already printed the error to console
            //Just continue and hope for the best
            
            //We can't use ctx, so a bit difficult to inform the user of this
        }
        
        //Get all messages from DB
        try {
            Map< Integer, MessageForHtml > messages = MessageMapper.getMessages( connectionPool );
            
            Integer[] messagesArray = messages.keySet().toArray( new Integer[ 0 ] );
            
            tailMessageId = messagesArray[ messagesArray.length - 1 ];
            
            ChatserverController.C2_ALL_MESSAGES.putAll( messages );
            
        } catch ( DatabaseException e ) {
            //Oh no! Well, we already printed the error to console
            //Just continue and hope for the best
            
            //We can't use ctx, so a bit difficult to inform the user of this
        }
        
        c2StartOnlineChecker( connectionPool );
        
        //TODO: Use config.appData() for global attributes?
    }
    
    private static void c2StartOnlineChecker( ConnectionPool connectionPool )
    {
        //Start Online Checker Thread
        onlineCheckThread = new Thread( () -> onlineChecker( connectionPool ) );
        onlineCheckThread.start();
    }
    
    private static void onlineChecker( ConnectionPool connectionPool ) //Runs only once, but keeps running on a new thread :)
    {
        System.out.println( "Thread: Online Checker started!" );
        
        List< String > keyset;
        Set< String > newOnline;
        long time;
        long timeCurrent;
        
        Set< String > noLongerOnline;
        MessageForHtml messageForHtml;
        String timeCurrentStringForMessage;
        
        try {
            
            while ( true ) {
                while ( true ) {
                    Thread.sleep( ONLINE_CHECK_INTERVAL ); //Once every 10? seconds, check if everyone 'online' is still online
                    
                    keyset = new ArrayList<>( C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.keySet() );
                    Collections.reverse( keyset );
                    
                    newOnline = new TreeSet<>();
                    
                    timeCurrent = System.currentTimeMillis();
                    
                    for ( String username : keyset ) {
                        time = C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.get( username );
                        
                        if ( time < ( timeCurrent - ONLINE_TIMEOUT ) ) {
//                            System.out.println( username + " was last online too long ago!" );
                            break;
                        }
                        newOnline.add( username );
                    }

//                    for ( String username : newOnline ) {
//                        System.out.println( "New Online: " + username );
//                    }
//
//                    for ( String username : C2_ONLINE ) {
//                        System.out.println( "Online: " + username );
//                    }
                    
                    if ( newOnline.containsAll( C2_ONLINE ) ) {
                        break;
                    }
                    
                    noLongerOnline = new TreeSet<>( C2_ONLINE );

//                    System.out.println( "NO LONGER ONLINE" );
//                    for ( String username : noLongerOnline ) {
//                        System.out.println( "No Longer Online: " + username );
//                    }
                    
                    noLongerOnline.removeAll( newOnline );
                    
                    timeCurrentStringForMessage = getTime();
                    
                    for ( String usernameNowOffline : noLongerOnline ) {
                        messageForHtml = new MessageForHtml();
                        messageForHtml.setSender( SYSTEM );
                        messageForHtml.setMessage( USER + usernameNowOffline + USER_LEFT );
                        messageForHtml.setReceiver( MessageForHtml.ALL );
                        messageForHtml.setTime( timeCurrentStringForMessage );
                        
                        addMessageForHtml( connectionPool, messageForHtml );
                    }
                    
                    C2_OFFLINE.addAll( noLongerOnline );
                    C2_ONLINE.removeAll( noLongerOnline );
                }
            }
            
        } catch ( InterruptedException e ) {
            System.out.println( "Thread: Online Checker -Interrupted" );
            System.out.println( "errorMessage: " + e.getMessage() );
        }
        
        System.out.println( "Thread: Online Checker Ended!       (Please say the server is shutting down, otherwise SHIT)" );
    }
    
    
    
    
    
    //Public Misc---------------------------------------------------------------------------------
    public static void c2AddNewlyCreatedUser( String username )
    {
        C2_LAST_KNOWN_ACTIVITY_BY_USERNAME.put( username, 0L );
        
        C2_OFFLINE.add( username );
    }
    
    public static void close()
    {
        onlineCheckThread.interrupt();
    }
    
    
    
    private static class CurrentlyOnline
    {
        
        public String getCurrentlyOnline() //Used in thymeleaf in html
        {
            int currentlyOnlineNumber = ChatserverController.C2_ONLINE.size();
            
            String currentlyOnline = "Currently Online: " + currentlyOnlineNumber + "\n";
            
            if ( currentlyOnlineNumber == 0 ) {
                return currentlyOnline +
                       "Be brave, start talking!";
            }
            
            if ( currentlyOnlineNumber == 1 ) {
                return currentlyOnline +
                       "Pls come and talk to me!\n" +
                       "I am so lonely!!!";
            }
            
            return currentlyOnline +
                   "Come and join the chat!";
        }
        
    }
    
}



