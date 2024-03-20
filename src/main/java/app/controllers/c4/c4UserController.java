package app.controllers.c4;

import app.entities.Task;
import app.entities.User;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c4.FoodMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.List;

public class c4UserController
{
    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.get("/c4", ctx -> index(ctx, connectionPool));
        app.get("/search", ctx -> search(ctx, connectionPool));
    }

    private static void search(Context ctx, ConnectionPool connectionPool) {
        String taskName = ctx.formParam("taskname");
        if (taskName.length() > 3) {
            User user = ctx.sessionAttribute("currentUser"); // den kigger i vores session state og ser om der findes en key der hedder currentUser,
            // hvilket der er hvis man er logget ind
            try {
                Task newTask = FoodMapper.choose(user, taskName, connectionPool);
                List<Task> taskList = TaskMapper.getAllTasksPerUser(user.getUserId(), connectionPool);
                ctx.attribute("taskList", taskList); // attribute bliver nulstillet ligeså snart vi er blevet sendt videre til task.html
                ctx.render("task.html");
            } catch (DatabaseException e) {
                ctx.attribute("message", "Noget gik galt. Prøv evt. igen.");
                ctx.render("task.html");
            }
        }



    }

    private static void index(Context ctx, ConnectionPool connectionPool)
    {
        ctx.render("/c4/index.html");
    }
}