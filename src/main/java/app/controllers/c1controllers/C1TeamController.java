package app.controllers.c1controllers;

import app.entities.c1entities.C1Task;
import app.entities.c1entities.C1Team;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c1persistence.C1TaskMapper;
import app.persistence.c1persistence.C1TeamMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

import java.util.List;

public class C1TeamController {

    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.post("login", ctx -> login(ctx, connectionPool));
        app.get("logout", ctx -> logout(ctx));
        app.post("createTeam", ctx -> createTeam(ctx, connectionPool));


    }

    private static void createTeam(Context ctx, ConnectionPool connectionPool) {

        String teamName = ctx.formParam("teamName");
        String password = ctx.formParam("password");

        try {

            C1Team team = C1TeamMapper.createAccount(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");


        } catch (DatabaseException e) {
            ctx.attribute("message", e.getMessage());
            ctx.render("c1templates/c1login.html");
        }


    }

    private static void logout(Context ctx) {

        ctx.req().getSession().invalidate();
        ctx.redirect("/");
    }

    private static void login(Context ctx, ConnectionPool connectionPool) {

        String teamName = ctx.formParam("teamName");
        String password = ctx.formParam("password");

        try {
            C1Team team = C1TeamMapper.login(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");

        } catch (DatabaseException e) {
            ctx.attribute("message", e.getMessage());
            ctx.render("c1templates/c1login.html");
        }
    }
}
