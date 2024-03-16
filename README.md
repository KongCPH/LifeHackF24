# Lifehack Spring 2024 - team A

![Lifehack](src/main/resources/public/images/lifehacklogo.png)

## Install instructions

1. Clone this repo
2. Create a `lifehack` database in Postgres
3. Open IntelliJ and import all dependencies
4. Copy sql from `/resources/sql/lifehack.sql` to postgres and execute
5. Build and run and view on port 7070

## Each group

1. Find a lifehack project you wish to build
2. Create a folder in `templates` with you project name and create an `index.html` file
```html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<title>Projectname</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../public/css/styles.css" th:href="@{/css/styles.css}" rel="stylesheet"/>
<link href="../../public/css/projectname.css" th:href="@{/css/styles.css}" rel="stylesheet"/>
</head>

<body>

<div class="page">
    <header>
        <a href="../index.html" th:href="@{/}">
            <img alt="logo" src="../../public/images/lifehacklogo.png" th:src="@{/images/lifehacklogo.png}"/>
        </a>
    </header>

    <h1>Project name</h1>

    <p>Make your splash page here</p>
</div>
</body>
</html>
```

3. Create a css file in the `public/css` folder called `projectname.css`

4. Create a ProjectNameController in the `app/controllers` folder like this:

    ```java
    package app.controllers;
    
    import app.persistence.ConnectionPool;
    import io.javalin.Javalin;
    import io.javalin.http.Context;
    
    public class ProjectNameController
    {
        public static void addRoutes(Javalin app, ConnectionPool connectionPool)
        {
            app.get("/projectname", ctx -> index(ctx, connectionPool));
        }
    
        private static void index(Context ctx, ConnectionPool connectionPool)
        {
            ctx.render("/projectname/index.html");
        }
    }
    ```
   
5. Add routing to Main:

    ```java
    ProjectNameController.addRoutes(app, connectionPool);
    ```