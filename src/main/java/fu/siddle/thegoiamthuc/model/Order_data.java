package fu.siddle.thegoiamthuc.model;

public class Order_data {

    private String foodname;

    private int order_id;
    private int fooditem_id;
    private int amout;

    public Order_data() {
    }

    public Order_data(int order_id, int fooditem_id, int amout) {
        this.order_id = order_id;
        this.fooditem_id = fooditem_id;
        this.amout = amout;
    }

    public Order_data(String foodname, int order_id, int fooditem_id, int amout) {
        this.foodname = foodname;
        this.order_id = order_id;
        this.fooditem_id = fooditem_id;
        this.amout = amout;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getFooditem_id() {
        return fooditem_id;
    }

    public void setFooditem_id(int fooditem_id) {
        this.fooditem_id = fooditem_id;
    }

    public int getAmout() {
        return amout;
    }

    public void setAmout(int amout) {
        this.amout = amout;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

}
