package app.controllers.c4;

import app.entities.Task;
import app.entities.User;
import app.entities.c4.Food;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c4.FoodMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.List;

public class c4UserController {
    public static void addRoutes(Javalin app, ConnectionPool connectionPool) {
        app.get("/c4", ctx -> index(ctx, connectionPool));
        app.post("/search", ctx -> search(ctx, connectionPool));
    }

    private static void search(Context ctx, ConnectionPool connectionPool) {
        String foodMonth = ctx.formParam("month");
        String foodCategory = ctx.formParam("food_category");
        if (!(foodMonth=="Choose month") || !(foodCategory=="Choose category")) {

            try {
                Food newFood = FoodMapper.choose(foodMonth, foodCategory, connectionPool);
                List<Food> foodList = FoodMapper.choose();
                ctx.attribute("taskList", taskList); // attribute bliver nulstillet ligeså snart vi er blevet sendt videre til task.html
                ctx.render("index.html");
            } catch (DatabaseException e) {
                ctx.attribute("message", "Noget gik galt. Prøv evt. igen.");
                ctx.render("task.html");
            }
        }


    }

    private static void index(Context ctx, ConnectionPool connectionPool) {
        ctx.render("/c4/index.html");
    }
}