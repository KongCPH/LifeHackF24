package app.controllers.c1controllers;

import app.entities.c1entities.C1Team;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;
import app.persistence.c1persistence.C1TeamMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;

public class C1TeamController {

    public static void addRoutes(Javalin app, ConnectionPool connectionPool)
    {
        app.post("login", ctx -> login(ctx, connectionPool));
        app.post("logout", ctx -> logout(ctx));
        app.post("createTeam", ctx -> createTeam(ctx, connectionPool));


    }

    private static void createTeam(Context ctx, ConnectionPool connectionPool) {

        String teamName = ctx.formParam("teamname");
        String password = ctx.formParam("password");

        try {

            C1Team team = C1TeamMapper.createAccount(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team.getTeamName());
            ctx.render("c1dashboard.html");


        } catch (DatabaseException e) {
            ctx.attribute("message", e.getMessage());
            ctx.render("c1login.html");
        }


    }

    private static void logout(Context ctx) {

        ctx.req().getSession().invalidate();
        ctx.redirect("/");
    }

    private static void login(Context ctx, ConnectionPool connectionPool) {

        String teamName = ctx.formParam("teamname");
        String password = ctx.formParam("password");

        try {
            C1Team team = C1TeamMapper.login(teamName, password, connectionPool);
            ctx.sessionAttribute("team", team.getTeamName());
            ctx.render("c1dashboard.html");

        } catch (DatabaseException e) {
            ctx.attribute("message", e.getMessage());
            ctx.render("c1login.html");
        }
    }
}
