package app.controllers.c3;

import app.persistence.ConnectionPool;
import io.javalin.Javalin;
import io.javalin.http.Context;

public class ControllerC3 {
    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.get("/c3", ctx -> index(ctx, connectionPool));
    }

    private static void index(Context ctx, ConnectionPool connectionPool)
    {
        ctx.render("/c3/index.html");
    }
}
