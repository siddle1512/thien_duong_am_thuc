
package fu.siddle.thegoiamthuc.model;

public class OrderData {
    int orderid;
    int fooditemid;
    int amount;

    public OrderData() {
    }

    public OrderData(int orderid, int fooditemid, int amount) {
        this.orderid = orderid;
        this.fooditemid = fooditemid;
        this.amount = amount;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getFooditemid() {
        return fooditemid;
    }

    public void setFooditemid(int fooditemid) {
        this.fooditemid = fooditemid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "OrderData{" + "orderid=" + orderid + ", fooditemid=" + fooditemid + ", amount=" + amount + '}';
    }
    
}
