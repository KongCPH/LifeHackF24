package app.c2.constants;

public interface FormParam
{
    String c2Send =  "c2Send"; //Submit form-action AKA a user sends a message
    String c2NewMessageMessage =  "c2NewMessageMessage"; //The message String
    String c2NewMessageSender =  "c2NewMessageSender"; //The sender's username String  (AKA the user who sent the message)
    String c2NewMessageReceiver =  "c2NewMessageReceiver"; //The receiver's username String (including the special receiver @AlL)
}
