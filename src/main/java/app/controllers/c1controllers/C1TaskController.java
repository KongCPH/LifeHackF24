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
        app.post("addTask", ctx -> addTask(ctx, connectionPool));
        app.post("removeTask", ctx -> deleteTask(ctx, connectionPool));
    }

    private static void deleteTask(Context ctx, ConnectionPool connectionPool) {

        int taskId = Integer.parseInt(ctx.formParam("taskID"));

        try {
            C1Team team = ctx.sessionAttribute("team");
            C1TaskMapper.deleteTask(taskId, connectionPool);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");

        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
    }

    private static void addTask(Context ctx, ConnectionPool connectionPool) {
        String taskName = ctx.formParam("taskName");
        String description = ctx.formParam("description");
        String responsible = ctx.formParam("responsible");

        try{
            C1Team team = ctx.sessionAttribute("team");
            C1TaskMapper.addTask(taskName, description, responsible, team.getTeamID(), connectionPool);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
    }

    private static void moveTask(Context ctx, ConnectionPool connectionPool) {
        int taskID = Integer.parseInt(ctx.formParam("taskID"));
        int lifeCycleID = Integer.parseInt(ctx.formParam("lifeCycleID"));
        String taskResponsible = ctx.formParam("taskResponsible");

        try{
            C1Team team = ctx.sessionAttribute("team");
            if (taskResponsible.isBlank()) {

            C1TaskMapper.moveTask(taskID, lifeCycleID, connectionPool);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");
            } else {

                C1TaskMapper.moveTask(taskID, lifeCycleID, connectionPool);
                List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
                ctx.attribute("taskList", taskList);
                ctx.render("c1templates/c1dashboard.html");

            }
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
    }


}
