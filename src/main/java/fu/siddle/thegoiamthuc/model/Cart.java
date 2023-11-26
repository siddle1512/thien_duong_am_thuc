package fu.siddle.thegoiamthuc.model;

public class Cart {

    private User user;
    private Fooditem fooditem;
    private int quantity;

    public Cart() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Fooditem getFooditem() {
        return fooditem;
    }

    public void setFooditem(Fooditem fooditem) {
        this.fooditem = fooditem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
