package fu.siddle.thegoiamthuc.model;

public class Fooditem {

    int id;
    String name;
    int category_id;
    int price;
    String image;

    public Fooditem() {
    }

    public Fooditem(int id, String name, int category_id, int price, String image) {
        this.id = id;
        this.name = name;
        this.category_id = category_id;
        this.price = price;
        this.image = image;
    }

    public Fooditem(String name, int category_id, int price, String image) {
        this.name = name;
        this.category_id = category_id;
        this.price = price;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Fooditem{" + "id=" + id + ", name=" + name + ", category_id=" + category_id + ", price=" + price + ", image=" + image + '}';
    }

}
