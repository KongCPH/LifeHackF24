package app.c2.constants;

public interface CtxSessionAttributes
{
    String currentUser = "currentUser"; //User, -Made by signe
    String c2AllMessages = "c2AllMessages"; //TreeMap< Integer, MessageForHtml >  (message_id, MessageForHtml)  (sorted from highest to lowest)
    String c2LastKnownActivityByUsername = "c2LastKnownActivityByUsername"; //LinkedHashMap<String, Long>  (username, TimeInMS (since 1970) )  (The time is the last known activity)
    String c2Online = "c2Online"; //Set<String>  (username)
    String c2Offline = "c2Offline"; //Set<String>  (username)
    String c2Frontpage = "c2Frontpage"; //CurrentlyOnline, (custom string from method that changes slightly)
    
    
}
