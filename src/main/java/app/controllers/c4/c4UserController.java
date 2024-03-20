package app.controllers.c4;

import app.entities.c4.Food;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c4.FoodMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.ArrayList;
import java.util.List;

public class c4UserController {
    public static void addRoutes(Javalin app, ConnectionPool connectionPool) {
        app.get("/c4", ctx -> index(ctx, connectionPool));
        app.post("/search", ctx -> search(ctx, connectionPool));
    }

    private static void search(Context ctx, ConnectionPool connectionPool) throws DatabaseException {
        String foodMonth = ctx.formParam("month");
        String foodCategory = ctx.formParam("food_category");
        if (!(("Choose month").equals(foodMonth)) || !(("Choose category").equals(foodCategory))) {

            try {
                Food newFood = FoodMapper.search(foodMonth, foodCategory, connectionPool);
                List<Food> foodList = new ArrayList<>();
                ctx.attribute("foodList", foodList);
                ctx.render("c4/index.html");
            } catch (DatabaseException e) {
                ctx.attribute("message", "Please choose categories!!!");
                ctx.render("c4/index.html");
            }
        }


    }

    private static void index(Context ctx, ConnectionPool connectionPool) {
        ctx.render("/c4/index.html");
    }
}