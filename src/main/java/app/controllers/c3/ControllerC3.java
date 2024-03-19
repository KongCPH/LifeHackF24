package app.controllers.c3;

import app.entities.c3.Instructions;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c3.InstructionsMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.ArrayList;
import java.util.List;

public class ControllerC3 {
    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.get("/c3", ctx -> index(ctx, connectionPool));
    }

    private static void index(Context ctx, ConnectionPool connectionPool)
    {
        List<Instructions> instructions = new ArrayList<>();

        try {
            instructions = InstructionsMapper.getAllInstructions(connectionPool);
            ctx.attribute("instructionsList",instructions);
            ctx.render("/c3/index.html");

        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }

    }
}
