package app.entities.c4;

public class Food
{
    private int foodId;
    private String foodDescription;
    private String foodMonth;
    private String foodCategory;
    private String foodItem;


    public Food(int foodId, String foodDescription, String foodMonth, String foodCategory, String foodItem) {
        this.foodId = foodId;
        this.foodDescription = foodDescription;
        this.foodMonth = foodMonth;
        this.foodCategory = foodCategory;
        this.foodItem = foodItem;
    }

    public Food(String foodMonth, String foodCategory) {
        this.foodMonth = foodMonth;
        this.foodCategory = foodCategory;
    }

    public int getFoodId() {
        return foodId;
    }

    public String getFoodDescription() {
        return foodDescription;
    }

    public String getFoodMonth() {
        return foodMonth;
    }

    public String getFoodCategory() {
        return foodCategory;
    }

    public String getFoodItem() {
        return foodItem;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodId=" + foodId +
                ", foodDescription='" + foodDescription + '\'' +
                ", foodMonth='" + foodMonth + '\'' +
                ", foodCategory='" + foodCategory + '\'' +
                ", foodItem='" + foodItem + '\'' +
                '}';
    }
}
