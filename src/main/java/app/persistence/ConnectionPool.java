package app.persistence;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/***
 * Singleton pattern applied to handling a Hikari ConnectionPool
 */
public class ConnectionPool
{

    public static ConnectionPool instance = null;
    public static HikariDataSource ds = null;

    /***
     * Empty and private constructor due to single pattern. Use getInstance methods to
     * instantiate and get a connection pool.
     */
    private ConnectionPool()
    {
    }

    /***
     * Getting a singleton instance of a Hikari Connection Pool with specific credentials
     * and connection string. If an environment variable "DEPLOYED" exists then local
     * environment variables will be inserted with user credentials and DB connection string
     * @param user for Postgresql database user
     * @param password for Postgresql database user
     * @param url connection string for postgresql database. Remember to add currentSchema to string
     * @param db database name for connection
     * @return A ConnectionPool object
     */
    public static ConnectionPool getInstance(String user, String password, String url, String db)
    {
        if (instance == null)
        {
            if (System.getenv("DEPLOYED") != null)
            {
                ds = createHikariConnectionPool(
                        System.getenv("JDBC_USER"),
                        System.getenv("JDBC_PASSWORD"),
                        System.getenv("JDBC_CONNECTION_STRING"),
                        System.getenv("JDBC_DB"));
            } else
            {
                ds = createHikariConnectionPool(user, password, url, db);
            }
            instance = new ConnectionPool();
        }
        return instance;
    }

    /***
     * Getting a live connection from a Hikari Connection Pool
     * @return a database connection to be used in sql requests
     * @throws SQLException
     */
    public synchronized Connection getConnection() throws SQLException
    {
        return ds.getConnection();
    }

    /***
     * Closing a Hikari Connection Pool after use.
     */
    public synchronized void close()
    {
        Logger.getLogger("web").log(Level.INFO, "Shutting down connection pool");
        ds.close();
    }

    /***
     * Configuring a Hikari DataSource ConnectionPool. Default pool size is 3.
     * @param user for Postgresql database user
     * @param password for Postgresql database user
     * @param url connection string for postgresql database. Remember to add currentSchema to string
     * @param db database name for connection
     * @return a Hikari DataSource
     */
    private static HikariDataSource createHikariConnectionPool(String user, String password, String url, String db)
    {
        Logger.getLogger("web").log(Level.INFO,
                String.format("Connection Pool created for: (%s, %s, %s, %s)", user, password, url, db));
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.postgresql.Driver");
        config.setJdbcUrl(String.format(url, db));
        config.setUsername(user);
        config.setPassword(password);
        config.setMaximumPoolSize(3);
        config.setPoolName("Postgresql Pool");
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        return new HikariDataSource(config);
    }
}