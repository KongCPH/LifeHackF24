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


    // denne metode er samling for ruter
    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        // dette er vores index route
        app.get("/c3", ctx -> index(ctx, connectionPool));
    }


    // denne metode kaldes i route
    private static void index(Context ctx, ConnectionPool connectionPool)
    {
        // Her skabes en liste der kan indeholde alle instructions hentet i DB
        List<Instructions> instructions = new ArrayList<>();

        try {
            // metoden getAllInstructions henter instructions fra DB, og i denne linje sættes den hentet data på listen "instructions"
            instructions = InstructionsMapper.getAllInstructions(connectionPool);
            //her kan man få adgang til denne liste ved nedenstående key-value, key er et navn der kan kaldes fra frontenden, og value er selv listen.
            ctx.attribute("instructionsList",instructions);
            //her renderes den relevante html-side for dette
            ctx.render("/c3/index.html");

        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }

    }
}
