package app.c2.constants;

public interface Pages //Pages the user can visit!
{
    String indexPage = "/"+Info.GROUP_NAME + "/"; //Default chatserver page
    String c2SendPage = indexPage+FormParam.c2Send; //When we send a message
}
