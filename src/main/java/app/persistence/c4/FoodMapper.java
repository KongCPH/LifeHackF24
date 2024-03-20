package app.persistence.c4;

import app.entities.c4.Food;
import app.exceptions.DatabaseException;
import org.postgresql.jdbc2.optional.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FoodMapper {
    public static Food choose(String foodMonth, String foodCategory,String foodDescription,String foodItem, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "SELECT food_item FROM food_of_season WHERE food_month=? AND food_category =?";
        try(
            Connection connection = connectionPool.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        )
        {
            ps.setString(1,foodMonth);
            ps.setString(2,foodCategory);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                int id = rs.getInt("foodid");
                foodMonth = rs.getString("foodmonth");
                foodCategory = rs.getString("foodcategory");
                foodDescription = rs.getString("fooddescription");
                foodItem = rs.getString("fooditem");
                return new Food(id,foodMonth, foodCategory,foodDescription,foodItem);
            }else {
                throw new DatabaseException("Fejl i SQL Søgningen, kunne ikke finde det på databasen.");
            }
        } catch (SQLException e) {
            throw new DatabaseException("DB Fejl", e.getMessage());
        }
    }
}
