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
        app.get("/c1templates/login", ctx -> index(ctx, connectionPool));
        app.get("/c1templates/", ctx -> index(ctx, connectionPool));
        app.post("/c1templates/login", ctx -> login(ctx, connectionPool));
        app.get("/c1templates/logout", ctx -> logout(ctx));
        app.post("/c1templates/createTeam", ctx -> createTeam(ctx, connectionPool));


    }
    
    private static void index( Context ctx, ConnectionPool connectionPool )
    {
        ctx.render( "c1templates/c1login.html" );
    }
    
    private static void createTeam(Context ctx, ConnectionPool connectionPool) {

        String loginName = ctx.formParam("loginName");
        String teamName = ctx.formParam("teamName");
        String password = ctx.formParam("password");

        try {

            C1Team team = C1TeamMapper.createAccount(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team);
            ctx.sessionAttribute("loginName", loginName);
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

        String loginName = ctx.formParam("loginName");
        String teamName = ctx.formParam("teamName");
        String password = ctx.formParam("password");

        try {
            C1Team team = C1TeamMapper.login(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team);
            ctx.sessionAttribute("loginName", loginName);
            List<C1Task> taskList = C1TaskMapper.getAllTasksPerTeam(team.getTeamID(), connectionPool);
            ctx.attribute("taskList", taskList);
            ctx.render("c1templates/c1dashboard.html");

        } catch (DatabaseException e) {
            ctx.attribute("message", e.getMessage());
            ctx.render("c1templates/c1login.html");
        }
    }
}
