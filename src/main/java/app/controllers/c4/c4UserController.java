package app.controllers.c4;

import app.persistence.ConnectionPool;
import io.javalin.Javalin;
import io.javalin.http.Context;

public class c4UserController
{
    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.get("/c4", ctx -> index(ctx, connectionPool));
    }

    private static void index(Context ctx, ConnectionPool connectionPool)
    {
        ctx.render("/c4/index.html");
    }
}