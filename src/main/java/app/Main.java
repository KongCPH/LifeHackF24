package app;

import app.config.ThymeleafConfig;
import app.controllers.UserController;
import app.controllers.c2.ChatserverController;
import app.controllers.c3.ControllerC3;
import app.persistence.ConnectionPool;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinThymeleaf;

public class Main
{
    private static final String USER = "postgres";
    private static final String PASSWORD = "postgres";
    private static final String URL = "jdbc:postgresql://localhost:5432/%s?currentSchema=public";
    private static final String DB = "lifehack";

    private static final ConnectionPool connectionPool = ConnectionPool.getInstance(USER, PASSWORD, URL, DB);

    public static void main(String[] args)
    {
        // Initializing Javalin and Jetty webserver

        Javalin app = Javalin.create(config -> {
            config.staticFiles.add("/public");
            config.fileRenderer(new JavalinThymeleaf(ThymeleafConfig.templateEngine()));
            ChatserverController.c2Start( config, connectionPool );
        }).start(7070);

        // Routing

        app.get("/", ctx -> ctx.render("index.html"));
        UserController.addRoutes(app, connectionPool);
        TimeZonesController.addRoutes(app, connectionPool);
        
        ChatserverController.c2AddRoutes( app, connectionPool );
        ControllerC3.addRoutes(app, connectionPool); // controlleren indeholder routes til vores views, altså hvor viden er, forbindelse til det skabes her.
    }
}