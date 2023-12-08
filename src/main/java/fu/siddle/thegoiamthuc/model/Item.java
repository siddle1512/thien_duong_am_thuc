package fu.siddle.thegoiamthuc.model;

public class Item {

    private Fooditem fooditem;
    private int quantity;
    private int price;

    public Item() {
    }

    public Item(Fooditem fooditem, int quantity, int price) {
        this.fooditem = fooditem;
        this.quantity = quantity;
        this.price = price;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
