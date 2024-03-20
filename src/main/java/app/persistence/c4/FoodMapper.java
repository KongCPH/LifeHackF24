package app.persistence.c4;

import app.entities.c4.Food;
import app.exceptions.DatabaseException;
import app.persistence.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodMapper {
    public static List<Food> search(String foodMonth, String foodCategory, ConnectionPool connectionPool) throws DatabaseException {
        List<Food> foodList = new ArrayList<>();
        String sql = "SELECT * FROM food_of_season WHERE food_month=? AND food_category =?";
        try (
                Connection connection = connectionPool.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        ) {
            ps.setString(1, foodMonth);
            ps.setString(2, foodCategory);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int foodId = rs.getInt("food_id");
                foodMonth = rs.getString("food_month");
                foodCategory = rs.getString("food_category");
                String foodDescription = rs.getString("food_description");
                String foodItem = rs.getString("food_item");
                foodList.add(new Food(foodId, foodDescription, foodMonth, foodCategory, foodItem));

            }
        } catch (SQLException e) {
            throw new DatabaseException("DB Fejl", e.getMessage());
        }
        return foodList;
    }
}
