package app.controllers.c1controllers;

import app.entities.c1entities.C1Task;
import app.entities.c1entities.C1Team;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c1persistence.C1TaskMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.List;

import static app.persistence.c1persistence.C1TaskMapper.moveTask;


public class C1TaskController {

    public static void addRoutes(Javalin app, ConnectionPool connectionPool) {
        app.post("movetask", ctx -> moveTask(ctx, connectionPool));
    }

    private static void moveTask(Context ctx, ConnectionPool connectionPool) {
        C1Team team = ctx.sessionAttribute("team");

        try{
            int task_id = Integer.parseInt(ctx.formParam("task_id"));
            int lifecycle = Integer.parseInt(ctx.formParam("lifecycle_id"));
            C1TaskMapper.moveTask(task_id, lifecycle, connectionPool);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("dashboard.html");
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }

    }

}
